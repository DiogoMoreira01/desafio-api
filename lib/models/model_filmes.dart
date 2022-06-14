import 'dart:convert';

class ModelFilmes {
  bool adult;
  String backdropPath;
  List<int> genrsId;
  String? id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  ModelFilmes({
    required this.adult,
    required this.backdropPath,
    required this.genrsId,
     this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genrsId,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory ModelFilmes.fromMap(Map<String, dynamic> map) {
    return ModelFilmes(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      genrsId: List<int>.from(map['genre_ids']),
      id: map['id'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity'] ?? 0,
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average'].toDouble(),
      voteCount: map['vote_count'] ?? 0,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ModelFilmes.fromJson(String json) =>
      ModelFilmes.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'ModelFilmes(adult: $adult, backdropPath: $backdropPath, genrsId: $genrsId, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}
