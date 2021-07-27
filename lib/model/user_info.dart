class UserInfo {
  String birthdate;
  String displayImg;
  String email;
  String fullName;
  String gender;
  int id;
  bool isActive ;
  String username;
  int ratings_count;

  UserInfo(
      {this.birthdate,
        this.displayImg,
        this.email,
        this.fullName,
        this.gender,
        this.id,
        this.isActive,
        this.username,
        this.ratings_count});

  UserInfo.fromJson(Map<String, dynamic> json) {
    birthdate = json['birthdate'];
    displayImg = json['display_img'];
    email = json['email'];
    fullName = json['full_name'];
    gender = json['gender'];
    id = json['id'];
    isActive = json['is_active'];
    username = json['username'];
    ratings_count = json['ratings_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthdate'] = this.birthdate;
    data['display_img'] = this.displayImg;
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['username'] = this.username;
    data['ratings_count'] = this.ratings_count;
    return data;
  }
}