import 'package:stray_care/model/user_reportincedent_model.dart';

class AdoptionNotificationModel {
  String uid;
  String? notiId;
  // String message;
  ReportIncidentModel reportIncidentModel;
  int contactNumber;
  String adoptionRequestDate;
  String collectiondate;

  AdoptionNotificationModel(
      {required this.contactNumber,

      // required this.message,
      this.notiId,
      required this.reportIncidentModel,
      required this.collectiondate,
      required this.adoptionRequestDate,
      required this.uid});
  Map<String, dynamic> toJson(id) => {
        "adoptionRequestDate": adoptionRequestDate,
        "uid": uid, "collectiondate": collectiondate,
        "notiId": id,
        // "message": message,
        "reportIncidentModel": reportIncidentModel.toJson(id),
        "contactNumber": contactNumber
      };
  factory AdoptionNotificationModel.fromjson(Map<String, dynamic> json) {
    return AdoptionNotificationModel(
        adoptionRequestDate: json["adoptionRequestDate"],
        collectiondate: json["collectiondate"],
        contactNumber: json["contactNumber"],
        // message: json["message"],
        notiId: json["notiId"],
        reportIncidentModel: json["reportIncidentModel"],
        uid: json["uid"]);
  }
}
