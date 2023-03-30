/// adult : false
/// backdrop_path : "/bHePzkyRcMhnab2qZbhj1bCElnf.jpg"
/// belongs_to_collection : null
/// budget : 6000000
/// genres : [{"id":35,"name":"Comedy"},{"id":18,"name":"Drama"},{"id":14,"name":"Fantasy"}]
/// homepage : "http://www.lasciencedesreves-lefilm.com/accueil.htm"
/// id : 300
/// imdb_id : "tt0354899"
/// original_language : "fr"
/// original_title : "La Science des rêves"
/// overview : "A man entranced by his dreams and imagination is lovestruck with a French woman and feels he can show her his world."
/// popularity : 12.497
/// poster_path : "/1qCq228LsNtUseCnNE7Naw6NBUz.jpg"
/// production_companies : [{"id":11911,"logo_path":null,"name":"Partizan Films","origin_country":""},{"id":9,"logo_path":"/nda3dTUYdDrJ6rZqBpYvY865aDv.png","name":"Gaumont","origin_country":"FR"},{"id":591,"logo_path":"/q5I5RDwMEiqoNmfaJgd2LraEOJY.png","name":"France 3 Cinéma","origin_country":"FR"},{"id":6586,"logo_path":null,"name":"TPS Star","origin_country":"FR"},{"id":11912,"logo_path":null,"name":"Mikado Film","origin_country":"IT"},{"id":104,"logo_path":"/9aotxauvc9685tq9pTcRJszuT06.png","name":"Canal+","origin_country":"FR"}]
/// production_countries : [{"iso_3166_1":"FR","name":"France"},{"iso_3166_1":"IT","name":"Italy"}]
/// release_date : "2006-02-11"
/// revenue : 9524340
/// runtime : 105
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"},{"english_name":"French","iso_639_1":"fr","name":"Français"},{"english_name":"Spanish","iso_639_1":"es","name":"Español"}]
/// status : "Released"
/// tagline : "Close your eyes. Open your heart."
/// title : "The Science of Sleep"
/// video : false
/// vote_average : 7.055
/// vote_count : 649

class DetailMovieResponse {
  DetailMovieResponse({
      bool? adult, 
      String? backdropPath, 
      dynamic belongsToCollection, 
      num? budget, 
      List<Genres>? genres, 
      String? homepage, 
      num? id, 
      String? imdbId, 
      String? originalLanguage, 
      String? originalTitle, 
      String? overview, 
      num? popularity, 
      String? posterPath, 
      List<ProductionCompanies>? productionCompanies, 
      List<ProductionCountries>? productionCountries, 
      String? releaseDate, 
      num? revenue, 
      num? runtime, 
      List<SpokenLanguages>? spokenLanguages, 
      String? status, 
      String? tagline, 
      String? title, 
      bool? video, 
      num? voteAverage, 
      num? voteCount,}){
    _adult = adult;
    _backdropPath = backdropPath;
    _belongsToCollection = belongsToCollection;
    _budget = budget;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _imdbId = imdbId;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _releaseDate = releaseDate;
    _revenue = revenue;
    _runtime = runtime;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  DetailMovieResponse.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'] != null ? _backdropPath = json['backdrop_path'] : _posterPath = json['poster_path'];
    _belongsToCollection = json['belongs_to_collection'];
    _budget = json['budget'];
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    _releaseDate = json['release_date'];
    _revenue = json['revenue'];
    _runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      _spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        _spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  dynamic _belongsToCollection;
  num? _budget;
  List<Genres>? _genres;
  String? _homepage;
  num? _id;
  String? _imdbId;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  List<ProductionCompanies>? _productionCompanies;
  List<ProductionCountries>? _productionCountries;
  String? _releaseDate;
  num? _revenue;
  num? _runtime;
  List<SpokenLanguages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _title;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;
DetailMovieResponse copyWith({  bool? adult,
  String? backdropPath,
  dynamic belongsToCollection,
  num? budget,
  List<Genres>? genres,
  String? homepage,
  num? id,
  String? imdbId,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  num? popularity,
  String? posterPath,
  List<ProductionCompanies>? productionCompanies,
  List<ProductionCountries>? productionCountries,
  String? releaseDate,
  num? revenue,
  num? runtime,
  List<SpokenLanguages>? spokenLanguages,
  String? status,
  String? tagline,
  String? title,
  bool? video,
  num? voteAverage,
  num? voteCount,
}) => DetailMovieResponse(  adult: adult ?? _adult,
  backdropPath: backdropPath ?? _backdropPath,
  belongsToCollection: belongsToCollection ?? _belongsToCollection,
  budget: budget ?? _budget,
  genres: genres ?? _genres,
  homepage: homepage ?? _homepage,
  id: id ?? _id,
  imdbId: imdbId ?? _imdbId,
  originalLanguage: originalLanguage ?? _originalLanguage,
  originalTitle: originalTitle ?? _originalTitle,
  overview: overview ?? _overview,
  popularity: popularity ?? _popularity,
  posterPath: posterPath ?? _posterPath,
  productionCompanies: productionCompanies ?? _productionCompanies,
  productionCountries: productionCountries ?? _productionCountries,
  releaseDate: releaseDate ?? _releaseDate,
  revenue: revenue ?? _revenue,
  runtime: runtime ?? _runtime,
  spokenLanguages: spokenLanguages ?? _spokenLanguages,
  status: status ?? _status,
  tagline: tagline ?? _tagline,
  title: title ?? _title,
  video: video ?? _video,
  voteAverage: voteAverage ?? _voteAverage,
  voteCount: voteCount ?? _voteCount,
);
  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  dynamic get belongsToCollection => _belongsToCollection;
  num? get budget => _budget;
  List<Genres>? get genres => _genres;
  String? get homepage => _homepage;
  num? get id => _id;
  String? get imdbId => _imdbId;
  String? get originalLanguage => _originalLanguage;
  String? get originalTitle => _originalTitle;
  String? get overview => _overview;
  num? get popularity => _popularity;
  String? get posterPath => _posterPath;
  List<ProductionCompanies>? get productionCompanies => _productionCompanies;
  List<ProductionCountries>? get productionCountries => _productionCountries;
  String? get releaseDate => _releaseDate;
  num? get revenue => _revenue;
  num? get runtime => _runtime;
  List<SpokenLanguages>? get spokenLanguages => _spokenLanguages;
  String? get status => _status;
  String? get tagline => _tagline;
  String? get title => _title;
  bool? get video => _video;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath != null ? map['backdrop_path'] = _backdropPath : map['poster_path'] = _posterPath;
    map['belongs_to_collection'] = _belongsToCollection;
    map['budget'] = _budget;
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['imdb_id'] = _imdbId;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    if (_productionCompanies != null) {
      map['production_companies'] = _productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map['production_countries'] = _productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = _releaseDate;
    map['revenue'] = _revenue;
    map['runtime'] = _runtime;
    if (_spokenLanguages != null) {
      map['spoken_languages'] = _spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {
  SpokenLanguages({
      String? englishName, 
      String? iso6391, 
      String? name,}){
    _englishName = englishName;
    _iso6391 = iso6391;
    _name = name;
}

  SpokenLanguages.fromJson(dynamic json) {
    _englishName = json['english_name'];
    _iso6391 = json['iso_639_1'];
    _name = json['name'];
  }
  String? _englishName;
  String? _iso6391;
  String? _name;
SpokenLanguages copyWith({  String? englishName,
  String? iso6391,
  String? name,
}) => SpokenLanguages(  englishName: englishName ?? _englishName,
  iso6391: iso6391 ?? _iso6391,
  name: name ?? _name,
);
  String? get englishName => _englishName;
  String? get iso6391 => _iso6391;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = _englishName;
    map['iso_639_1'] = _iso6391;
    map['name'] = _name;
    return map;
  }

}

/// iso_3166_1 : "FR"
/// name : "France"

class ProductionCountries {
  ProductionCountries({
      String? iso31661, 
      String? name,}){
    _iso31661 = iso31661;
    _name = name;
}

  ProductionCountries.fromJson(dynamic json) {
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
  }
  String? _iso31661;
  String? _name;
ProductionCountries copyWith({  String? iso31661,
  String? name,
}) => ProductionCountries(  iso31661: iso31661 ?? _iso31661,
  name: name ?? _name,
);
  String? get iso31661 => _iso31661;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = _iso31661;
    map['name'] = _name;
    return map;
  }

}

/// id : 11911
/// logo_path : null
/// name : "Partizan Films"
/// origin_country : ""

class ProductionCompanies {
  ProductionCompanies({
      num? id, 
      dynamic logoPath, 
      String? name, 
      String? originCountry,}){
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
}

  ProductionCompanies.fromJson(dynamic json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }
  num? _id;
  dynamic _logoPath;
  String? _name;
  String? _originCountry;
ProductionCompanies copyWith({  num? id,
  dynamic logoPath,
  String? name,
  String? originCountry,
}) => ProductionCompanies(  id: id ?? _id,
  logoPath: logoPath ?? _logoPath,
  name: name ?? _name,
  originCountry: originCountry ?? _originCountry,
);
  num? get id => _id;
  dynamic get logoPath => _logoPath;
  String? get name => _name;
  String? get originCountry => _originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['name'] = _name;
    map['origin_country'] = _originCountry;
    return map;
  }

}

/// id : 35
/// name : "Comedy"

class Genres {
  Genres({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Genres.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Genres copyWith({  num? id,
  String? name,
}) => Genres(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}