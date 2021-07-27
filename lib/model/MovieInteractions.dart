class MovieInteractions {
  double rating;
  List<String> reviews;

  MovieInteractions({this.rating, this.reviews});

  MovieInteractions.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    reviews = json['reviews'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    return data;
  }
}