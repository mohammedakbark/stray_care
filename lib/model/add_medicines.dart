class AddMedicines {
  String? medicineID;
  String medicineName;
  String usage;

  AddMedicines(
      {required this.medicineName,
       this.medicineID,
      required this.usage});

  Map<String, dynamic> toJson(id) => {
        "medicineID": id,
        "medicineName": medicineName,
        "usage": usage,
      };
  factory AddMedicines.fromJson(Map<String, dynamic> json) {
    return AddMedicines(
        medicineName: json["medicineName"],
        medicineID: json["medicineID"],
        usage: json["usage"]);
  }
}
