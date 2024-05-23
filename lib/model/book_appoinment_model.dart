class BookAppoinmentModel {
  String uid;
  String appoinmentDate;
  String time;
  String name;
  String place;
  String? bookingid;

  BookAppoinmentModel(
      {required this.appoinmentDate,
      required this.name,
      required this.uid,
      required this.place,
      required this.time,
      this.bookingid});
  Map<String, dynamic> toJson(id) => {
        "uid": uid,
        "appoinmentDate": appoinmentDate,
        "name": name,
        "bookingid": id,"time":time,
        "place": place,
      };
  factory BookAppoinmentModel.fromjson(Map<String, dynamic> json) {
    return BookAppoinmentModel(
      time:json["time"],
        place: json["place"],
        appoinmentDate: json["appoinmentDate"],
        name: json["name"],
        uid: json["uid"],
        bookingid: json["bookingid"]);
  }
}
