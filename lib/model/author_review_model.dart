class AuthorDetails {
  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  String name;
  String username;
  String avatarPath;
  double rating;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
    name: json["name"],
    username: json["username"],
    avatarPath: json["avatar_path"] == null ? null : json["avatar_path"],
    rating: json["rating"] == null ? null : json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath == null ? null : avatarPath,
    "rating": rating == null ? null : rating,
  };
}
