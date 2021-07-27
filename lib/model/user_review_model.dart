class UserReview{
  String message;
  String review;

  UserReview({this.message, this.review});

  UserReview.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review'] = this.review;
    return data;
  }
}