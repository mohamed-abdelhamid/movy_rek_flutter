import 'author_review_model.dart';

class Review {
  Review({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  String author;
  AuthorDetails authorDetails;
  String content;
  DateTime createdAt;
  String id;
  DateTime updatedAt;
  String url;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    author: json["author"],
    authorDetails: AuthorDetails.fromJson(json["author_details"]),
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": authorDetails.toJson(),
    "content": content,
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "url": url,
  };
}
