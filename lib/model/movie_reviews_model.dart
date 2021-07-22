import 'dart:convert';

import 'package:movy_rek_app/model/review_model.dart';

class MovieReview {
  MovieReview({
    this.id,
    this.page,
    this.reviews,
    this.totalPages,
    this.totalResults,
  });

  int id;
  int page;
  List<Review> reviews;
  int totalPages;
  int totalResults;

  factory MovieReview.fromJson(Map<String, dynamic> json) => MovieReview(
    id: json["id"],
    page: json["page"],
    reviews: List<Review>.from(json["results"].map((x) => Review.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "page": page,
    "results": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}


