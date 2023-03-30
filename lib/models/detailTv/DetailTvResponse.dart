import '../searchMovie/SearchMovieResponse.dart';

/// adult : false
/// backdrop_path : "/daOOxnT4RyIV8KKJZijgNRpWVOx.jpg"
/// created_by : []
/// episode_run_time : [60,42]
/// first_air_date : "2006-09-18"
/// genres : [{"id":10767,"name":"Talk"}]
/// homepage : "http://www.rachaelrayshow.com/"
/// id : 1991
/// in_production : true
/// languages : ["en"]
/// last_air_date : "2023-03-24"
/// last_episode_to_air : {"id":4304760,"name":"Rach's Chicken Enchiladas + Dr. Will Li Shares The Latest Research on Metabolism","overview":"Chef Scott Conant cooks a hit dish from his restaurant's menu: Focaccia di Recco with Stracchino Cheese. Later, Dr. Will Li talks about his new book \"Eat to Beat Your Diet!,\" sharing the latest research on metabolism and one of his favorite healthy recipes: one-pan chicken, rice & kale. In Rach's kitchen, she's cooking her chicken enchiladas topped with delicious Mexican crema.","vote_average":0.0,"vote_count":0,"air_date":"2023-03-24","episode_number":114,"production_code":"","runtime":42,"season_number":17,"show_id":1991,"still_path":null}
/// name : "Rachael Ray"
/// next_episode_to_air : null
/// networks : [{"id":184,"logo_path":null,"name":"Syndication","origin_country":"US"}]
/// number_of_episodes : 1295
/// number_of_seasons : 14
/// origin_country : ["US"]
/// original_language : "en"
/// original_name : "Rachael Ray"
/// overview : "Rachael Ray, also known as The Rachael Ray Show, is an American talk show starring Rachael Ray that debuted in syndication in the United States and Canada on September 18, 2006. It is filmed at Chelsea Television Studios in New York City. The show's 8th season premiered on September 9, 2013, and became the last Harpo show in syndication to switch to HD with a revamped studio. In January 2012, CBS Television Distribution announced a two-year renewal for the show, taking it through the 2013–14 season."
/// popularity : 10.676
/// poster_path : "/dsAJhCLYX1fiNRoiiJqR6Up4aJ.jpg"
/// production_companies : []
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// seasons : [{"air_date":null,"episode_count":0,"id":5906,"name":"Specials","overview":"","poster_path":null,"season_number":0},{"air_date":"2006-09-18","episode_count":211,"id":5904,"name":"Season 1","overview":"","poster_path":null,"season_number":1},{"air_date":null,"episode_count":84,"id":5905,"name":"Season 2","overview":"","poster_path":null,"season_number":2},{"air_date":null,"episode_count":0,"id":5907,"name":"Season 3","overview":"","poster_path":null,"season_number":3},{"air_date":null,"episode_count":0,"id":5908,"name":"Season 4","overview":"","poster_path":null,"season_number":4},{"air_date":null,"episode_count":0,"id":5909,"name":"Season 5","overview":"","poster_path":null,"season_number":5},{"air_date":null,"episode_count":123,"id":5910,"name":"Season 6","overview":"","poster_path":null,"season_number":6},{"air_date":null,"episode_count":180,"id":5911,"name":"Season 8","overview":"","poster_path":null,"season_number":8},{"air_date":null,"episode_count":0,"id":77032,"name":"Season 9","overview":"","poster_path":null,"season_number":9},{"air_date":"2015-09-14","episode_count":2,"id":77033,"name":"Season 10","overview":"","poster_path":null,"season_number":10},{"air_date":"2018-09-10","episode_count":101,"id":117911,"name":"Season 13","overview":"Season 13 new season begins Sept 10, 2018","poster_path":null,"season_number":13},{"air_date":"2019-09-09","episode_count":160,"id":132052,"name":"Season 14","overview":"","poster_path":null,"season_number":14},{"air_date":"2020-09-14","episode_count":160,"id":162255,"name":"Season 15","overview":"","poster_path":null,"season_number":15},{"air_date":"2021-09-13","episode_count":160,"id":210457,"name":"Season 16","overview":"","poster_path":null,"season_number":16},{"air_date":"2022-09-12","episode_count":114,"id":308098,"name":"Season 17","overview":"","poster_path":null,"season_number":17}]
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Returning Series"
/// tagline : ""
/// type : "Talk Show"
/// vote_average : 5.181
/// vote_count : 47

class DetailTvResponse {
  DetailTvResponse({
      bool? adult, 
      String? backdropPath, 
      List<dynamic>? createdBy, 
      List<num>? episodeRunTime, 
      String? firstAirDate, 
      List<Genres>? genres, 
      String? homepage, 
      num? id, 
      bool? inProduction, 
      List<String>? languages, 
      String? lastAirDate, 
      LastEpisodeToAir? lastEpisodeToAir, 
      String? name, 
      dynamic nextEpisodeToAir, 
      List<Networks>? networks, 
      num? numberOfEpisodes, 
      num? numberOfSeasons, 
      List<String>? originCountry, 
      String? originalLanguage, 
      String? originalName, 
      String? overview, 
      num? popularity, 
      String? posterPath, 
      List<dynamic>? productionCompanies, 
      List<ProductionCountries>? productionCountries, 
      List<Seasons>? seasons, 
      List<SpokenLanguages>? spokenLanguages, 
      String? status, 
      String? tagline, 
      String? type, 
      num? voteAverage, 
      num? voteCount,}){
    _adult = adult;
    _backdropPath = backdropPath;
    _createdBy = createdBy;
    _episodeRunTime = episodeRunTime;
    _firstAirDate = firstAirDate;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _inProduction = inProduction;
    _languages = languages;
    _lastAirDate = lastAirDate;
    _lastEpisodeToAir = lastEpisodeToAir;
    _name = name;
    _nextEpisodeToAir = nextEpisodeToAir;
    _networks = networks;
    _numberOfEpisodes = numberOfEpisodes;
    _numberOfSeasons = numberOfSeasons;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _seasons = seasons;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _type = type;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  DetailTvResponse.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      _createdBy = [];
      json['created_by'].forEach((v) {
        _createdBy?.add(Dynamic.fromJson(v));
      });
    }
    _episodeRunTime = json['episode_run_time'] != null ? json['episode_run_time'].cast<num>() : [];
    _firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _inProduction = json['in_production'];
    _languages = json['languages'] != null ? json['languages'].cast<String>() : [];
    _lastAirDate = json['last_air_date'];
    _lastEpisodeToAir = json['last_episode_to_air'] != null ? LastEpisodeToAir.fromJson(json['last_episode_to_air']) : null;
    _name = json['name'];
    _nextEpisodeToAir = json['next_episode_to_air'];
    if (json['networks'] != null) {
      _networks = [];
      json['networks'].forEach((v) {
        _networks?.add(Networks.fromJson(v));
      });
    }
    _numberOfEpisodes = json['number_of_episodes'];
    _numberOfSeasons = json['number_of_seasons'];
    _originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies?.add(Dynamic.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      _seasons = [];
      json['seasons'].forEach((v) {
        _seasons?.add(Seasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      _spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        _spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _type = json['type'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  List<dynamic>? _createdBy;
  List<num>? _episodeRunTime;
  String? _firstAirDate;
  List<Genres>? _genres;
  String? _homepage;
  num? _id;
  bool? _inProduction;
  List<String>? _languages;
  String? _lastAirDate;
  LastEpisodeToAir? _lastEpisodeToAir;
  String? _name;
  dynamic _nextEpisodeToAir;
  List<Networks>? _networks;
  num? _numberOfEpisodes;
  num? _numberOfSeasons;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  List<dynamic>? _productionCompanies;
  List<ProductionCountries>? _productionCountries;
  List<Seasons>? _seasons;
  List<SpokenLanguages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _type;
  num? _voteAverage;
  num? _voteCount;

  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  List<dynamic>? get createdBy => _createdBy;
  List<num>? get episodeRunTime => _episodeRunTime;
  String? get firstAirDate => _firstAirDate;
  List<Genres>? get genres => _genres;
  String? get homepage => _homepage;
  num? get id => _id;
  bool? get inProduction => _inProduction;
  List<String>? get languages => _languages;
  String? get lastAirDate => _lastAirDate;
  LastEpisodeToAir? get lastEpisodeToAir => _lastEpisodeToAir;
  String? get name => _name;
  dynamic get nextEpisodeToAir => _nextEpisodeToAir;
  List<Networks>? get networks => _networks;
  num? get numberOfEpisodes => _numberOfEpisodes;
  num? get numberOfSeasons => _numberOfSeasons;
  List<String>? get originCountry => _originCountry;
  String? get originalLanguage => _originalLanguage;
  String? get originalName => _originalName;
  String? get overview => _overview;
  num? get popularity => _popularity;
  String? get posterPath => _posterPath;
  List<dynamic>? get productionCompanies => _productionCompanies;
  List<ProductionCountries>? get productionCountries => _productionCountries;
  List<Seasons>? get seasons => _seasons;
  List<SpokenLanguages>? get spokenLanguages => _spokenLanguages;
  String? get status => _status;
  String? get tagline => _tagline;
  String? get type => _type;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    if (_createdBy != null) {
      map['created_by'] = _createdBy?.map((v) => v.toJson()).toList();
    }
    map['episode_run_time'] = _episodeRunTime;
    map['first_air_date'] = _firstAirDate;
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    } else map['genres'] = ' ';
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['in_production'] = _inProduction;
    map['languages'] = _languages;
    map['last_air_date'] = _lastAirDate;
    if (_lastEpisodeToAir != null) {
      map['last_episode_to_air'] = _lastEpisodeToAir?.toJson();
    }
    map['name'] = _name;
    map['next_episode_to_air'] = _nextEpisodeToAir;
    if (_networks != null) {
      map['networks'] = _networks?.map((v) => v.toJson()).toList();
    }
    map['number_of_episodes'] = _numberOfEpisodes;
    map['number_of_seasons'] = _numberOfSeasons;
    map['origin_country'] = _originCountry;
    map['original_language'] = _originalLanguage;
    map['original_name'] = _originalName;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    if (_productionCompanies != null) {
      map['production_companies'] = _productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map['production_countries'] = _productionCountries?.map((v) => v.toJson()).toList();
    }
    if (_seasons != null) {
      map['seasons'] = _seasons?.map((v) => v.toJson()).toList();
    }
    if (_spokenLanguages != null) {
      map['spoken_languages'] = _spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['type'] = _type;
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

/// air_date : null
/// episode_count : 0
/// id : 5906
/// name : "Specials"
/// overview : ""
/// poster_path : null
/// season_number : 0

class Seasons {
  Seasons({
      dynamic airDate, 
      num? episodeCount, 
      num? id, 
      String? name, 
      String? overview, 
      dynamic posterPath, 
      num? seasonNumber,}){
    _airDate = airDate;
    _episodeCount = episodeCount;
    _id = id;
    _name = name;
    _overview = overview;
    _posterPath = posterPath;
    _seasonNumber = seasonNumber;
}

  Seasons.fromJson(dynamic json) {
    _airDate = json['air_date'];
    _episodeCount = json['episode_count'];
    _id = json['id'];
    _name = json['name'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _seasonNumber = json['season_number'];
  }
  dynamic _airDate;
  num? _episodeCount;
  num? _id;
  String? _name;
  String? _overview;
  dynamic _posterPath;
  num? _seasonNumber;

  dynamic get airDate => _airDate;
  num? get episodeCount => _episodeCount;
  num? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  dynamic get posterPath => _posterPath;
  num? get seasonNumber => _seasonNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = _airDate;
    map['episode_count'] = _episodeCount;
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['season_number'] = _seasonNumber;
    return map;
  }

}

/// iso_3166_1 : "US"
/// name : "United States of America"

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

  String? get iso31661 => _iso31661;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = _iso31661;
    map['name'] = _name;
    return map;
  }

}

/// id : 184
/// logo_path : null
/// name : "Syndication"
/// origin_country : "US"

class Networks {
  Networks({
      num? id, 
      dynamic logoPath, 
      String? name, 
      String? originCountry,}){
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
}

  Networks.fromJson(dynamic json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }
  num? _id;
  dynamic _logoPath;
  String? _name;
  String? _originCountry;

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

/// id : 4304760
/// name : "Rach's Chicken Enchiladas + Dr. Will Li Shares The Latest Research on Metabolism"
/// overview : "Chef Scott Conant cooks a hit dish from his restaurant's menu: Focaccia di Recco with Stracchino Cheese. Later, Dr. Will Li talks about his new book \"Eat to Beat Your Diet!,\" sharing the latest research on metabolism and one of his favorite healthy recipes: one-pan chicken, rice & kale. In Rach's kitchen, she's cooking her chicken enchiladas topped with delicious Mexican crema."
/// vote_average : 0.0
/// vote_count : 0
/// air_date : "2023-03-24"
/// episode_number : 114
/// production_code : ""
/// runtime : 42
/// season_number : 17
/// show_id : 1991
/// still_path : null

class LastEpisodeToAir {
  LastEpisodeToAir({
      num? id, 
      String? name, 
      String? overview, 
      num? voteAverage, 
      num? voteCount, 
      String? airDate, 
      num? episodeNumber, 
      String? productionCode, 
      num? runtime, 
      num? seasonNumber, 
      num? showId, 
      dynamic stillPath,}){
    _id = id;
    _name = name;
    _overview = overview;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _airDate = airDate;
    _episodeNumber = episodeNumber;
    _productionCode = productionCode;
    _runtime = runtime;
    _seasonNumber = seasonNumber;
    _showId = showId;
    _stillPath = stillPath;
}

  LastEpisodeToAir.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _overview = json['overview'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
    _airDate = json['air_date'];
    _episodeNumber = json['episode_number'];
    _productionCode = json['production_code'];
    _runtime = json['runtime'];
    _seasonNumber = json['season_number'];
    _showId = json['show_id'];
    _stillPath = json['still_path'];
  }
  num? _id;
  String? _name;
  String? _overview;
  num? _voteAverage;
  num? _voteCount;
  String? _airDate;
  num? _episodeNumber;
  String? _productionCode;
  num? _runtime;
  num? _seasonNumber;
  num? _showId;
  dynamic _stillPath;

  num? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;
  String? get airDate => _airDate;
  num? get episodeNumber => _episodeNumber;
  String? get productionCode => _productionCode;
  num? get runtime => _runtime;
  num? get seasonNumber => _seasonNumber;
  num? get showId => _showId;
  dynamic get stillPath => _stillPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    map['air_date'] = _airDate;
    map['episode_number'] = _episodeNumber;
    map['production_code'] = _productionCode;
    map['runtime'] = _runtime;
    map['season_number'] = _seasonNumber;
    map['show_id'] = _showId;
    map['still_path'] = _stillPath;
    return map;
  }

}

/// id : 10767
/// name : "Talk"

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

  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}