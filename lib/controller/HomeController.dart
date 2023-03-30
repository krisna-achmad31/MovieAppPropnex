import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/components/text.dart';
import 'package:PropnexTestApp/models/nowPlayingMovie/NowPlayingResponse.dart' as nowPlaying;
import 'package:PropnexTestApp/models/popularMovie/PopularMovieResponse.dart' as popular;
import 'package:PropnexTestApp/models/recommendationMovie/RecommendationMovieResponse.dart' as recommendation;
import 'package:PropnexTestApp/models/recommendationTv/RecommendationTvResponse.dart' as recommendationTv;
import 'package:PropnexTestApp/models/tvOnTheAir/TvOnTheAirResponse.dart' as tvOnTheAir;
import 'package:PropnexTestApp/models/tvPopular/TvPopularResponse.dart' as tvPopular;
import 'package:PropnexTestApp/pages/DetailPage.dart';
import 'package:PropnexTestApp/repository/MovieRepository.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../pages/ListPage.dart';
import 'CheckConnectionController.dart';

class HomeController extends GetxController {
  List<nowPlaying.Results> itemNowPlaying = [];
  List<popular.Results> itemPopular = [];
  List<recommendation.Results> itemRecommendation = [];
  List<tvOnTheAir.Results> itemTvOnTheAir = [];
  List<tvPopular.Results> itemTvPopular = [];
  List<recommendationTv.Results> itemRecommendationTv = [];
  List<Widget> bannerImageDefault = [
    SkeletonAvatar(
      style: SkeletonAvatarStyle(width: double.infinity),
    ),
    SkeletonAvatar(
      style: SkeletonAvatarStyle(width: double.infinity),
    ),
    SkeletonAvatar(
      style: SkeletonAvatarStyle(width: double.infinity),
    ),
  ];
  List<Widget> bannerImageDefaultTv = [
    SkeletonAvatar(
      style: SkeletonAvatarStyle(width: double.infinity, height: 239, borderRadius: BorderRadius.circular(10)),
    ),
    SkeletonAvatar(
      style: SkeletonAvatarStyle(width: double.infinity, height: 239, borderRadius: BorderRadius.circular(10)),
    ),
    SkeletonAvatar(
      style: SkeletonAvatarStyle(width: double.infinity, height: 239, borderRadius: BorderRadius.circular(10)),
    ),
  ];
  List<Widget> bannerImage = [];
  List<Widget> bannerImageTv = [];

  var loadingDataNow = false.obs;
  var loadingDataPopular = false.obs;
  var loadingDataRecommended = false.obs;
  var loadingDataTvOnTheAir = false.obs;
  var loadingDataTvPopular = false.obs;
  var loadingDataRecommendedTv = false.obs;

  var _count = 0.obs;
  var itemPerPage = 5;
  var _currentPage = 0.obs;
  var pageCount = 0;
  var perPageItem = 1;
  var lastPageItemLength = 0;
  var selectedIndex = 0.obs;

  CarouselController carouselController = CarouselController();
  CheckConnectionStream checkConnectionStream = CheckConnectionStream();
  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    initCheckConnection();
    getNowPlaying();
    getPopular();
    getRecommendedMovie();
    getTvOnTheAir();
    getTvPopular();
    getRecommendedTv();
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

  void getNowPlaying() async {
    loadingDataNow(true);
    try {
      nowPlaying.NowPlayingResponse nowPlayingResponse = await MovieRepository().getListNowPlaying('1');
      if (nowPlayingResponse.totalResults != 0) {
        itemNowPlaying = nowPlayingResponse.results!;
        print(nowPlayingResponse.results);
        await loadingDataNow(false);
      }
      print(nowPlayingResponse.results?.length);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void getPopular() async {
    loadingDataPopular(true);
    try {
      popular.PopularMovieResponse popularMovieResponse = await MovieRepository().getListPopular('1');
      if (popularMovieResponse.totalResults != 0) {
        itemPopular = popularMovieResponse.results!;
        print(popularMovieResponse.results);
        await loadingDataPopular(false);
      }
      print(popularMovieResponse.results?.length);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void getRecommendedMovie() async {
    loadingDataRecommended(true);
    try {
      recommendation.RecommendationMovieResponse recommendationMovieResponse = await MovieRepository().getListRecommendation();
      itemRecommendation = recommendationMovieResponse.results!;
      bannerImage = recommendationMovieResponse.results!.map((e) {
        return Stack(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(width: double.infinity, height: double.infinity, borderRadius: BorderRadius.circular(10)),
            ),
            InkWell(
              onTap: () {
                moveToDetail(e.id.toString(), 'Movie');
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500/${e.backdropPath!}'), fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        );
      }).toList();
      notifyChildrens();
      loadingDataRecommended(false);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void getRecommendedTv() async {
    loadingDataRecommendedTv(false);
    try {
      recommendationTv.RecommendationTvResponse recommendationTvResponse = await MovieRepository().getRecommendationTv();
      itemRecommendationTv = recommendationTvResponse.results!;
      bannerImageTv = recommendationTvResponse.results!.map((e) {
        print(bannerImageTv.length);
        return Stack(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(width: double.infinity, height: double.infinity, borderRadius: BorderRadius.circular(10)),
            ),
            InkWell(
              onTap: () {
                moveToDetail(e.id.toString(), 'Tv');
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500/${e.backdropPath!}'), fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        );
      }).toList();
      notifyChildrens();
      await loadingDataRecommendedTv(false);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void getTvOnTheAir() async {
    loadingDataTvOnTheAir(true);
    try {
      tvOnTheAir.TvOnTheAirResponse tvOnTheAirResponse = await MovieRepository().getListTvOnTheAir('1');
      if (tvOnTheAirResponse.totalResults != 0) {
        itemTvOnTheAir = tvOnTheAirResponse.results!;
        print(tvOnTheAirResponse.results);
        await loadingDataTvOnTheAir(false);
      }
      print(tvOnTheAirResponse.results?.length);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void getTvPopular() async {
    loadingDataTvPopular(true);
    try {
      tvPopular.TvPopularResponse tvPopularResponse = await MovieRepository().getListTvPopular('1');
      if (tvPopularResponse.totalResults != 0) {
        itemTvPopular = tvPopularResponse.results!;
        print(tvPopularResponse.results);
        await loadingDataTvPopular(false);
      }
      print(tvPopularResponse.results?.length);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  int addPage() {
    itemPerPage = itemPerPage + 5;
    return itemPerPage;
  }

  void moveToDetail(String id, String cat) {
    Get.toNamed(DetailPage.routedName, arguments: [
      {'id': '$id'},
      {'cat': '$cat'},
    ]);
  }

  void moveToList(String title, String idCat) {
    Get.toNamed(ListPage.routedName, arguments: [
      {'title': title},
      {'cat': idCat}
    ]);
  }
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}
