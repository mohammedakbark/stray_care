class UserModel {
  String? uid;

  UserModel({
    this.uid,
  });

  Map<String, dynamic> toJson() => {"uid": uid};
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
    );
  }
}
