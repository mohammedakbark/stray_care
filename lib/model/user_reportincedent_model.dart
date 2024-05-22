import 'package:stray_care/model/user_model.dart';

class ReportIncidentModel {
  String uid;
  String? incidentId;
  String imageUrl;
  String description;
  String typeOfAnimal;
  String dateTime;
  String collectedPlace;
  bool adoptionOption;

  ReportIncidentModel(
      {required this.collectedPlace,
      required this.adoptionOption,
      required this.dateTime,
      required this.description,
      required this.imageUrl,
      this.incidentId,
      required this.typeOfAnimal,
      required this.uid});

  Map<String, dynamic> toJson(id) => {
        "uid": uid,
        "adoptionOption":adoptionOption,
        "incidentId": id,
        "imageUrl": imageUrl,
        "description": description,
        "typeOfAnimal": typeOfAnimal,
        "dateTime": dateTime,
        "collectedPlace": collectedPlace
      };
  factory ReportIncidentModel.fromJson(Map<String, dynamic> json) {
    return ReportIncidentModel(
      adoptionOption:json["adoptionOption"],
        collectedPlace: json["collectedPlace"],
        dateTime: json["dateTime"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        incidentId: json["incidentId"],
        typeOfAnimal: json["typeOfAnimal"],
        uid: json["uid"]);
  }
}
