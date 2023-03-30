import 'package:PropnexTestApp/models/detailTv/DetailTvResponse.dart';
import 'package:PropnexTestApp/models/nowPlayingMovie/NowPlayingResponse.dart';
import 'package:PropnexTestApp/models/detailMovie/DetailMovieResponse.dart';
import 'package:PropnexTestApp/models/popularMovie/PopularMovieResponse.dart';
import 'package:PropnexTestApp/models/recommendationMovie/RecommendationMovieResponse.dart';
import 'package:PropnexTestApp/models/recommendationTv/RecommendationTvResponse.dart';
import 'package:PropnexTestApp/models/searchMovie/SearchMovieResponse.dart';
import 'package:PropnexTestApp/models/searchTv/SearchTvResponse.dart';
import 'package:PropnexTestApp/models/tvPopular/TvPopularResponse.dart';
import 'package:PropnexTestApp/network/api_caller.dart';

import '../models/tvOnTheAir/TvOnTheAirResponse.dart';
import '../network/api_service.dart';

class MovieRepository {
  ApiCaller _apiProvider = ApiCaller();

  Future<NowPlayingResponse> getListNowPlayingLazy(String page) async {
    NowPlayingResponse nowPlayingResponse = await ApiService.getNowPlayingLazy(_apiProvider, page);

    return nowPlayingResponse;
  }

  Future<NowPlayingResponse> getListNowPlaying(String page) async {
    NowPlayingResponse nowPlayingResponse = await ApiService.getNowPlaying(_apiProvider, page);

    return nowPlayingResponse;
  }

  Future<DetailMovieResponse> getDetail(String id) async {
    DetailMovieResponse detailMovieResponse = await ApiService.getDetail(_apiProvider, id);

    return detailMovieResponse;
  }

  Future<SearchMovieResponse> searchMovie(String keyword) async {
    SearchMovieResponse searchMovieResponse = await ApiService.searchMovie(_apiProvider, keyword);

    return searchMovieResponse;
  }

  Future<SearchTvResponse> searchTv(String keyword) async {
    SearchTvResponse searchTvResponse = await ApiService.searchTv(_apiProvider, keyword);

    return searchTvResponse;
  }

  Future<PopularMovieResponse> getListPopular(String page) async {
    PopularMovieResponse popularMovieResponse = await ApiService.getPopular(_apiProvider, page);

    return popularMovieResponse;
  }

  Future<RecommendationMovieResponse> getListRecommendation() async {
    RecommendationMovieResponse recommendationMovieResponse = await ApiService.getRecommendation(_apiProvider);

    return recommendationMovieResponse;
  }

  Future<RecommendationTvResponse> getRecommendationTv() async {
    RecommendationTvResponse recommendationTvResponse = await ApiService.getRecommendationTv(_apiProvider);

    return recommendationTvResponse;
  }

  Future<TvOnTheAirResponse> getListTvOnTheAir(String page) async {
    TvOnTheAirResponse tvOnTheAirResponse = await ApiService.getTvOnTheAir(_apiProvider, page);

    return tvOnTheAirResponse;
  }

  Future<TvPopularResponse> getListTvPopular(String page) async {
    TvPopularResponse tvPopularResponse = await ApiService.getTvPopular(_apiProvider, page);

    return tvPopularResponse;
  }

  Future<DetailTvResponse> getDetailTv(String id) async {
    DetailTvResponse detailTvResponse = await ApiService.getTvDetail(_apiProvider, id);

    return detailTvResponse;
  }
}
