import 'package:stray_care/model/user_model.dart';

class ReportIncidentModel {
  String uid;
  String incidentId;
  String imageUrl;
  String description;
  String typeOfAnimal;
  String dateTime;
  String collectedPlace;

  ReportIncidentModel(
      {required this.collectedPlace,
      required this.dateTime,
      required this.description,
      required this.imageUrl,
      required this.incidentId,
      required this.typeOfAnimal,
      required this.uid});

  Map<String, dynamic> toJson(id) => {
        "uid": uid,
        "incidentId": id,
        "imageUrl": imageUrl,
        "description": description,
        "typeOfAnimal": typeOfAnimal,
        "dateTime": dateTime,
        "collectedPlace": collectedPlace
      };
  factory ReportIncidentModel.fromJson(Map<String, dynamic> json) {
    return ReportIncidentModel(
        collectedPlace: json["collectedPlace"],
        dateTime: json["dateTime"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        incidentId: json["incidentId"],
        typeOfAnimal: json["typeOfAnimal"],
        uid: json["uid"]);
  }
}
