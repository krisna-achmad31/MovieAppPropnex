/// adult : false
/// backdrop_path : "/a2tys4sD7xzVaogPntGsT1ypVoT.jpg"
/// genre_ids : [53,35,80]
/// id : 804150
/// original_language : "en"
/// original_title : "Cocaine Bear"
/// overview : "Inspired by a true story, an oddball group of cops, criminals, tourists and teens converge in a Georgia forest where a 500-pound black bear goes on a murderous rampage after unintentionally ingesting cocaine."
/// popularity : 3474.498
/// poster_path : "/gOnmaxHo0412UVr1QM5Nekv1xPi.jpg"
/// release_date : "2023-02-22"
/// title : "Cocaine Bear"
/// video : false
/// vote_average : 6.5
/// vote_count : 506

class Results {
  Results({
    bool? adult,
    String? backdropPath,
    List<num>? genreIds,
    num? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    String? releaseDate,
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
    _releaseDate = releaseDate;
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
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  List<num>? _genreIds;
  num? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;
  Results copyWith({  bool? adult,
    String? backdropPath,
    List<num>? genreIds,
    num? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) => Results(  adult: adult ?? _adult,
    backdropPath: backdropPath ?? _backdropPath,
    genreIds: genreIds ?? _genreIds,
    id: id ?? _id,
    originalLanguage: originalLanguage ?? _originalLanguage,
    originalTitle: originalTitle ?? _originalTitle,
    overview: overview ?? _overview,
    popularity: popularity ?? _popularity,
    posterPath: posterPath ?? _posterPath,
    releaseDate: releaseDate ?? _releaseDate,
    title: title ?? _title,
    video: video ?? _video,
    voteAverage: voteAverage ?? _voteAverage,
    voteCount: voteCount ?? _voteCount,
  );
  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  List<num>? get genreIds => _genreIds;
  num? get id => _id;
  String? get originalLanguage => _originalLanguage;
  String? get originalTitle => _originalTitle;
  String? get overview => _overview;
  num? get popularity => _popularity;
  String? get posterPath => _posterPath;
  String? get releaseDate => _releaseDate;
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
    map['release_date'] = _releaseDate;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}

/// maximum : "2023-03-26"
/// minimum : "2023-02-06"

class Dates {
  Dates({
    String? maximum,
    String? minimum,}){
    _maximum = maximum;
    _minimum = minimum;
  }

  Dates.fromJson(dynamic json) {
    _maximum = json['maximum'];
    _minimum = json['minimum'];
  }
  String? _maximum;
  String? _minimum;
  Dates copyWith({  String? maximum,
    String? minimum,
  }) => Dates(  maximum: maximum ?? _maximum,
    minimum: minimum ?? _minimum,
  );
  String? get maximum => _maximum;
  String? get minimum => _minimum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = _maximum;
    map['minimum'] = _minimum;
    return map;
  }

}