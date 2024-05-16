class ReportMissingModel {
  String uid;
  String? missingId;
  String imgUrl;
  String name;
  String description;
  String place;
  String date;
  String reportStatus;

  ReportMissingModel(
      {required this.date,
      required this.description,
      required this.imgUrl,
       this.missingId,
      required this.name,
      required this.place,
      required this.reportStatus,
      required this.uid});

  Map<String, dynamic> toJso(id) => {
        "uid": uid,
        "missingId": id,
        "imgUrl": imgUrl,
        "name": name,
        "description": description,
        "place": place,
        "reportStatus":reportStatus,
        "date": date
      };
  factory ReportMissingModel.fromjson(Map<String, dynamic> json) {
    return ReportMissingModel(
        date: json["date"],
        reportStatus:json["reportStatus"],
        description: json["description"],
        imgUrl: json["imgUrl"],
        missingId: json["missingId"],
        name: json["name"],
        place: json["place"],
        uid: json["uid"]);
  }
}
