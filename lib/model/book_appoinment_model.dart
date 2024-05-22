class BookAppoinmentModel {
  String uid;
  String appoinmentDate;
  String name;
  String bookingid;

  BookAppoinmentModel(
      {required this.appoinmentDate,
      required this.name,
      required this.uid,
      required this.bookingid});
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "appoinmentDate": appoinmentDate,
        "name": name,
        "bookingid": bookingid
      };
  factory BookAppoinmentModel.fromjson(Map<String, dynamic> json) {
    return BookAppoinmentModel(
        appoinmentDate: json["appoinmentDate"],
        name: json["name"],
        uid: json["uid"],
        bookingid: json["bookingid"]);
  }
}
