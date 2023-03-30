import 'package:PropnexTestApp/models/searchMovie/SearchMovieResponse.dart' as movieResponses;
import 'package:PropnexTestApp/models/searchTv/SearchTvResponse.dart' as tvResponses;
import 'package:PropnexTestApp/repository/MovieRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../pages/DetailPage.dart';
import 'CheckConnectionController.dart';

class SearchController extends GetxController {
  var keyword = TextEditingController(text: '');

  var loadingData = false.obs;

  var totalMovie = 0;
  var totalTv = 0;

  var empty = false.obs;

  FocusNode focusNode = FocusNode();

  List<movieResponses.Results> movieResult = [];
  List<tvResponses.Results> tvResult = [];

  CheckConnectionStream checkConnectionStream = CheckConnectionStream();

  @override
  void onInit() {
    initCheckConnection();
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

  void searchMovie(String keyword) async {
    loadingData(true);
    try {
      movieResponses.SearchMovieResponse searchMovieResponse = await MovieRepository().searchMovie(keyword);
      movieResult = searchMovieResponse.results!;
      totalMovie = int.parse(searchMovieResponse.totalResults.toString());
      searchTv(keyword);
      // await loadingData(false);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void searchTv(String keyword) async {
    // loadingData(true);
    try {
      tvResponses.SearchTvResponse searchTvResponse = await MovieRepository().searchTv(keyword);
      tvResult = searchTvResponse.results!;
      totalTv = int.parse(searchTvResponse.totalResults.toString());
      print(totalTv);
      print(totalMovie);
      validate();
      await loadingData(false);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  RxBool validate() {
    if (totalMovie == 0 && totalTv == 0) {
      empty(true);
    } else
      empty(false);
    return empty;
  }

  void moveToDetail(String id, String cat) {
    Get.toNamed(DetailPage.routedName, arguments: [
      {'id': '$id'},
      {'cat': '$cat'},
    ]);
  }
}
