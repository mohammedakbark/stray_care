class FoundMissingModel {
  String uid;
  String missingID;
  int contactNumber;

  FoundMissingModel(
      {required this.contactNumber,
      required this.missingID,
      required this.uid});
  Map<String, dynamic> toJson() =>
      {"uid": uid, "missingID": missingID, "contactNumber": contactNumber};
  factory FoundMissingModel.fromjson(Map<String, dynamic> json) {
    return FoundMissingModel(
        contactNumber: json["contactNumber"],
        missingID: json["missingID"],
        uid: json["uid"]);
  }
}
