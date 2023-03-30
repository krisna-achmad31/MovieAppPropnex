import 'package:PropnexTestApp/models/detailMovie/DetailMovieResponse.dart' as detailMovie;
import 'package:PropnexTestApp/models/detailTv/DetailTvResponse.dart' as detailTv;
import 'package:PropnexTestApp/models/searchMovie/SearchMovieResponse.dart' as movieResponses;
import 'package:PropnexTestApp/models/searchTv/SearchTvResponse.dart' as tvResponses;
import 'package:PropnexTestApp/repository/MovieRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/DetailPage.dart';

class DetailPageController extends GetxController {
  dynamic argumentData = Get.arguments;

  var id = '';
  var cat = '';
  var poster = '';
  var background = '';
  var tittle = '';
  var genre = '';
  var language = '';
  var year = '';
  var summary = '';
  var homepage = '';
  var rating = '';
  var voter = '';
  var position = '';

  var itemPerPage = 5;

  var loadingData = false.obs;

  List<movieResponses.Results> movieResult = [];
  List<tvResponses.Results> tvResult = [];

  @override
  void onInit() {
    // TODO: implement onInit
    print(argumentData[0]['id']);
    print(argumentData[1]['cat']);
    id = argumentData[0]['id'];
    cat = argumentData[1]['cat'];
    if (cat == 'Movie') {
      getInfoMovie(id);
    } else {
      getInfoTv();
    }

    super.onInit();
  }

  void getInfoMovie(String id) async {
    loadingData(true);
    try {
      detailMovie.DetailMovieResponse detailMovieResponse = await MovieRepository().getDetail(id);
      print(detailMovieResponse.backdropPath);
      poster = detailMovieResponse.posterPath!;
      background = detailMovieResponse.backdropPath!;
      tittle = detailMovieResponse.title!;
      if (detailMovieResponse.genres!.length != 0) {
        genre = detailMovieResponse.genres![0].name!;
      } else {
        genre = ' ';
      }
      language = detailMovieResponse.originalLanguage!;
      year = detailMovieResponse.releaseDate!;
      summary = detailMovieResponse.overview!;
      homepage = detailMovieResponse.homepage!;
      rating = detailMovieResponse.voteAverage!.toString();
      voter = detailMovieResponse.voteCount!.toString();
      if (genre != ' ') {
        searchMovie(genre);
      } else
        searchMovie('all');
      // await loadingData(false);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void getInfoTv() async {
    loadingData(true);
    try {
      detailTv.DetailTvResponse detailTvResponse = await MovieRepository().getDetailTv(id);
      poster = detailTvResponse.posterPath!;
      background = detailTvResponse.backdropPath!;
      tittle = detailTvResponse.name!;
      genre = detailTvResponse.genres![0].name!;
      language = detailTvResponse.originalLanguage!;
      year = detailTvResponse.firstAirDate!;
      summary = detailTvResponse.overview!;
      homepage = detailTvResponse.homepage!;
      rating = detailTvResponse.voteAverage!.toString();
      voter = detailTvResponse.voteCount!.toString();
      if (genre != ' ') {
        searchTv(genre);
      } else
        searchTv('all');
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void searchMovie(String keyword) async {
    try {
      movieResponses.SearchMovieResponse searchMovieResponse = await MovieRepository().searchMovie(keyword);
      movieResult = searchMovieResponse.results!;
      await loadingData(false);
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
      await loadingData(false);
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

  openLink(String link) async {
    try {
      if (await canLaunchUrl(Uri.parse('https://www.youtube.com'))) {
        await launchUrl(Uri.parse('https://www.youtube.com'), mode: LaunchMode.externalApplication);
      }
    } catch (e, stacktrace) {}
  }
}
