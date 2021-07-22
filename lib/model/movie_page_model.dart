
import 'movie_model.dart';

class MoviePageModel {
  MoviePageModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory MoviePageModel.fromJson(Map<String, dynamic> json) => MoviePageModel(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}