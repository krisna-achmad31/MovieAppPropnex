import 'dart:collection';

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

class ApiService {
  static Future<NowPlayingResponse> getNowPlayingLazy(ApiCaller apiProvider, String page) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    parameter.addAll({'page': '$page'});
    final response = await apiProvider.get('movie/now_playing', parameter);
    NowPlayingResponse nowPlayingResponse = NowPlayingResponse.fromJson(response);

    return nowPlayingResponse;
  }

  static Future<NowPlayingResponse> getNowPlaying(ApiCaller apiProvider, String page) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    parameter.addAll({'page': '$page'});
    final response = await apiProvider.get('movie/now_playing', parameter);
    NowPlayingResponse nowPlayingResponse = NowPlayingResponse.fromJson(response);

    return nowPlayingResponse;
  }

  static Future<DetailMovieResponse> getDetail(ApiCaller apiProvider, String id) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    final response = await apiProvider.get('movie/$id', parameter);
    DetailMovieResponse detailMovieResponse = DetailMovieResponse.fromJson(response);

    return detailMovieResponse;
  }

  static Future<SearchMovieResponse> searchMovie(ApiCaller apiProvider, String keyword) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'query': '$keyword'});
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    final response = await apiProvider.get('search/movie', parameter);
    SearchMovieResponse searchMovieResponse = SearchMovieResponse.fromJson(response);

    return searchMovieResponse;
  }

  static Future<SearchTvResponse> searchTv(ApiCaller apiProvider, String keyword) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'query': '$keyword'});
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    final response = await apiProvider.get('search/tv', parameter);
    SearchTvResponse searchTvResponse = SearchTvResponse.fromJson(response);

    return searchTvResponse;
  }

  static Future<PopularMovieResponse> getPopular(ApiCaller apiProvider, String page) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    parameter.addAll({'page': '$page'});
    final response = await apiProvider.get('movie/popular', parameter);
    PopularMovieResponse popularMovieResponse = PopularMovieResponse.fromJson(response);

    return popularMovieResponse;
  }

  static Future<RecommendationMovieResponse> getRecommendation(ApiCaller apiProvider) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    final response = await apiProvider.get('movie/300/recommendations', parameter);
    RecommendationMovieResponse recommendationMovieResponse = RecommendationMovieResponse.fromJson(response);

    return recommendationMovieResponse;
  }

  static Future<RecommendationTvResponse> getRecommendationTv(ApiCaller apiProvider) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    final response = await apiProvider.get('tv/1991/recommendations', parameter);
    RecommendationTvResponse recommendationTvResponse = RecommendationTvResponse.fromJson(response);

    return recommendationTvResponse;
  }

  static Future<TvOnTheAirResponse> getTvOnTheAir(ApiCaller apiProvider, String page) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    parameter.addAll({'page': '$page'});
    final response = await apiProvider.get('tv/on_the_air', parameter);
    TvOnTheAirResponse tvOnTheAirResponse = TvOnTheAirResponse.fromJson(response);

    return tvOnTheAirResponse;
  }

  static Future<TvPopularResponse> getTvPopular(ApiCaller apiProvider, String page) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    parameter.addAll({'page': '$page'});
    final response = await apiProvider.get('tv/popular', parameter);
    TvPopularResponse tvPopularResponse = TvPopularResponse.fromJson(response);

    return tvPopularResponse;
  }

  static Future<DetailTvResponse> getTvDetail(ApiCaller apiProvider, String id) async {
    HashMap<String, dynamic> parameter = HashMap();
    parameter.addAll({'api_key': 'fbb9572d11b5458ac98f02b84f2bafc4'});
    final response = await apiProvider.get('tv/$id', parameter);
    DetailTvResponse detailTvResponse = DetailTvResponse.fromJson(response);

    return detailTvResponse;
  }
}
