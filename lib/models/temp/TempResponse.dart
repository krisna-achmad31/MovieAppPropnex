/// page : 1
/// results : [{"adult":false,"backdrop_path":null,"genre_ids":[28,80,53],"id":730629,"original_language":"en","original_title":"John Wick: Chapter 5","overview":"The fifth instalment in the John Wick franchise, confirmed to be in development.","popularity":853.302,"poster_path":"/ndPy3KNHsbPQcoHU9RK92hSwEJ0.jpg","title":"John Wick: Chapter 5","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":"/r17jFHAemzcWPPtoO0UxjIX0xas.jpg","genre_ids":[28,53,80],"id":324552,"original_language":"en","original_title":"John Wick: Chapter 2","overview":"John Wick is forced out of retirement by a former associate looking to seize control of a shadowy international assassins’ guild. Bound by a blood oath to aid him, Wick travels to Rome and does battle against some of the world’s most dangerous killers.","popularity":923.062,"poster_path":"/hXWBc0ioZP3cN4zCu6SN3YHXZVO.jpg","release_date":"2017-02-08","title":"John Wick: Chapter 2","video":false,"vote_average":7.3,"vote_count":11158}]
/// total_pages : 37646
/// total_results : 752905

class TempResponse {
  TempResponse({
    num? page,
    List<Results>? results,
    num? totalPages,
    num? totalResults,}){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  TempResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  num? _page;
  List<Results>? _results;
  num? _totalPages;
  num? _totalResults;

  num? get page => _page;
  List<Results>? get results => _results;
  num? get totalPages => _totalPages;
  num? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}

/// adult : false
/// backdrop_path : null
/// genre_ids : [28,80,53]
/// id : 730629
/// original_language : "en"
/// original_title : "John Wick: Chapter 5"
/// overview : "The fifth instalment in the John Wick franchise, confirmed to be in development."
/// popularity : 853.302
/// poster_path : "/ndPy3KNHsbPQcoHU9RK92hSwEJ0.jpg"
/// title : "John Wick: Chapter 5"
/// video : false
/// vote_average : 0
/// vote_count : 0

class Results {
  Results({
      bool? adult,
      dynamic backdropPath,
      List<num>? genreIds,
      num? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      num? popularity,
      String? posterPath,
      String? title,
      bool? video,
      num? voteAverage,
      num? voteCount,}){
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  Results.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  dynamic _backdropPath;
  List<num>? _genreIds;
  num? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  String? _title;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;

  bool? get adult => _adult;
  dynamic get backdropPath => _backdropPath;
  List<num>? get genreIds => _genreIds;
  num? get id => _id;
  String? get originalLanguage => _originalLanguage;
  String? get originalTitle => _originalTitle;
  String? get overview => _overview;
  num? get popularity => _popularity;
  String? get posterPath => _posterPath;
  String? get title => _title;
  bool? get video => _video;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}