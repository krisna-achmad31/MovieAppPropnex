import 'package:PropnexTestApp/models/global/ResultsResponse.dart' as global;
import 'package:get/get.dart';
import 'package:PropnexTestApp/models/nowPlayingMovie/NowPlayingResponse.dart' as nowPlaying;
import 'package:PropnexTestApp/models/popularMovie/PopularMovieResponse.dart' as popular;
import 'package:PropnexTestApp/models/tvOnTheAir/TvOnTheAirResponse.dart' as tvOnTheAir;
import 'package:PropnexTestApp/models/tvPopular/TvPopularResponse.dart' as tvPopular;

import '../pages/DetailPage.dart';
import '../repository/MovieRepository.dart';
import 'CheckConnectionController.dart';

class ListPageController extends GetxController {
  dynamic argumentData = Get.arguments;

  var titlePage = '';
  var cat = '';

  var total = 0;
  var page = 1.obs;

  var loadingDataNow = false.obs;
  final lastPage = false.obs;
  var first = false.obs;

  final itemNowPlaying = <nowPlaying.Results>[].obs;
  final itemPopular = <popular.Results>[].obs;
  final itemTvOnTheAir = <tvOnTheAir.Results>[].obs;
  final itemTvPopular = <tvPopular.Results>[].obs;

  List<nowPlaying.Results> get itemNowPlayings => itemNowPlaying.toList();

  List<popular.Results> get itemPopulars => itemPopular.toList();

  List<tvOnTheAir.Results> get itemTvOnTheAirs => itemTvOnTheAir.toList();

  List<tvPopular.Results> get itemTvPopulars => itemTvPopular.toList();

  bool get last => lastPage.value;

  // List<nowPlaying.Results> itemNowPlaying = [];
  // List<popular.Results> itemPopular = [];
  List<global.Results> listItem = [];

  // List<tvOnTheAir.Results> itemTvOnTheAir = [];
  // List<tvPopular.Results> itemTvPopular = [];

  CheckConnectionStream checkConnectionStream = CheckConnectionStream();

  @override
  void onInit() {
    first(true);
    initCheckConnection();
    print(argumentData[0]['title']);
    print(argumentData[1]['cat']);
    titlePage = argumentData[0]['title'];
    cat = argumentData[1]['cat'];
    if (cat == 1.toString()) {
      getNowPlaying();
    } else if (cat == 2.toString()) {
      getPopular();
    } else if (cat == 3.toString()) {
      getTvOnTheAir();
    } else {
      getTvPopular();
    }
    super.onInit();
  }

  void initCheckConnection() {
    checkConnectionStream.initConnectivity();
    checkConnectionStream.connectivitySubscription = checkConnectionStream.connectivity.onConnectivityChanged.listen(checkConnectionStream.updateConnectionStatus);
  }

  @override
  void onClose() {
    checkConnectionStream.connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> getNowPlaying() async {
    loadingDataNow(true);
    try {
      nowPlaying.NowPlayingResponse nowPlayingResponse = await MovieRepository().getListNowPlaying(page.toString());
      if (nowPlayingResponse.totalResults != 0) {
        lastPage.value = true;
      } else {
        total = nowPlayingResponse.results.length;
      }
      page += 1;
      itemNowPlaying.addAll(nowPlayingResponse.results);
      await first(false);
      await loadingDataNow(false);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  Future<void> getPopular() async {
    loadingDataNow(true);
    try {
      popular.PopularMovieResponse popularMovieResponse = await MovieRepository().getListPopular(page.toString());
      if (popularMovieResponse.results!.isEmpty) {
        lastPage.value = true;
      } else {
        total = popularMovieResponse.results!.length;
      }
      page += 1;
      itemPopular.addAll(popularMovieResponse.results!);
      await first(false);
      await loadingDataNow(false);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  Future<void> getTvOnTheAir() async {
    loadingDataNow(true);
    try {
      tvOnTheAir.TvOnTheAirResponse tvOnTheAirResponse = await MovieRepository().getListTvOnTheAir(page.toString());
      if (tvOnTheAirResponse.totalResults != 0) {
        lastPage.value = true;
      } else {
        total = tvOnTheAirResponse.results!.length;
      }
      page += 1;
      itemTvOnTheAir.addAll(tvOnTheAirResponse.results!);
      await first(false);
      await loadingDataNow(false);
      print(tvOnTheAirResponse.results?.length);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  Future<void> getTvPopular() async {
    loadingDataNow(true);
    try {
      tvPopular.TvPopularResponse tvPopularResponse = await MovieRepository().getListTvPopular(page.toString());
      if (tvPopularResponse.totalResults != 0) {
        lastPage.value = true;
      } else {
        total = tvPopularResponse.results!.length;
      }
      page += 1;
      itemTvPopular.addAll(tvPopularResponse.results!);
      await first(false);
      await loadingDataNow(false);
      print(tvPopularResponse.results?.length);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void moveToDetail(String id, String cat) {
    Get.toNamed(DetailPage.routedName, arguments: [
      {'id': '$id'},
      {'cat': '$cat'},
    ]);
  }
}
