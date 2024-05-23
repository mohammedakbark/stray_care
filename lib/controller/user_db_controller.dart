import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/model/add_medicines.dart';
import 'package:stray_care/model/adoption_notification_model.dart';
import 'package:stray_care/model/book_appoinment_model.dart';
import 'package:stray_care/model/foundMissingModel.dart';
import 'package:stray_care/model/payment_model.dart';
import 'package:stray_care/model/user_report_missing_model.dart';
import 'package:stray_care/model/user_reportincedent_model.dart';

class UserDBController with ChangeNotifier {
  final db = FirebaseFirestore.instance;
//-- create

  Future reportNewIncident(ReportIncidentModel reportIncidentModel) async {
    final doc = db.collection("New Incident").doc();
    doc.set(reportIncidentModel.toJson(doc.id));
    // isImageLoading = false;
    // notifyListeners();
  }

  Future reportMissing(ReportMissingModel reportMissingModel) async {
    final docs = db.collection("Missing reports").doc();
    docs.set(reportMissingModel.toJso(docs.id));
  }

//-- Get
  List<ReportIncidentModel> listOfIncidents = [];
  Future getAllIncident() async {
    final snapShot = await db.collection("New Incident").get();
    listOfIncidents = snapShot.docs
        .map((e) => ReportIncidentModel.fromJson(e.data()))
        .toList();
  }

  List<ReportMissingModel> listOfOwnMissingReport = [];
  Future getOwnMissingReposts() async {
    final snapshot = await db
        .collection("Missing reports")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    listOfOwnMissingReport = snapshot.docs
        .map((e) => ReportMissingModel.fromjson(e.data()))
        .toList();
  }

  List<ReportMissingModel> listOfMissingReport = [];
  Future getAllMissingReposts() async {
    final snapshot = await db
        .collection("Missing reports")
        .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    listOfMissingReport = snapshot.docs
        .map((e) => ReportMissingModel.fromjson(e.data()))
        .toList();
  }

//-- delete

//-- update

//--------------Image

  final storegeRef = FirebaseStorage.instance;
  String? imageUrl;
  // bool isImageLoading = false;
  Future<String?> storeImage(File pickedFile, String imageCategoryPath) async {
    // isImageLoading = true;

    // notifyListeners();
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask = storegeRef
        .ref("$imageCategoryPath/${Timestamp.now().nanoseconds}")
        .putFile(pickedFile, metadata);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL().then((value) {
      imageUrl = value;

      return imageUrl;
    });
  }

  //-- searching
  List<ReportIncidentModel> searchResult = [];

  searchData(String searchElement) {
    searchResult = List.from(adoptableList);

    searchResult = adoptableList.where((element) {
      return element.collectedPlace
          .toLowerCase()
          .contains(searchElement.toLowerCase());
    }).toList();
    notifyListeners();
  }

  List<ReportIncidentModel> adoptableList = [];

  getAdoptableAnimals() async {
    final snapshot = await db
        .collection("New Incident")
        .where("adoptionOption", isEqualTo: true)
        .get();

    log(snapshot.docs.length.toString());
    adoptableList = snapshot.docs
        .map((e) => ReportIncidentModel.fromJson(e.data()))
        .toList();
  }

  Future makeAdoption(
      AdoptionNotificationModel adoptionNotificationModel, id) async {
    final doc = db.collection("Adoption request notification").doc(id);
    doc.set(adoptionNotificationModel.toJson(doc.id));
  }

  bool isAnimalalreadyAdopted = false;
  bool isTheAdoptedUserHim = false;
  Future checkTheAnimalIsAlreadyAdopted(id) async {
    final snapshot =
        await db.collection("Adoption request notification").doc(id).get();
    // final snap = await snapshot.get();
    if (snapshot.exists) {
      isAnimalalreadyAdopted = true;
      if (snapshot.data()!["uid"] == FirebaseAuth.instance.currentUser!.uid) {
        isTheAdoptedUserHim = true;
      } else {
        isTheAdoptedUserHim = false;
      }
    } else {
      isAnimalalreadyAdopted = false;
    }
  }
  //  vetirinery

  Future bookVetirinery(BookAppoinmentModel bookAppoinmentModel) async {
    final docs = db.collection("Appoinment to vetirinery").doc();
    docs.set(bookAppoinmentModel.toJson(docs.id));
  }

  List<BookAppoinmentModel> listOfMyBookings = [];
  fetchMyBookings() async {
    final snapshot = await db
        .collection("Appoinment to vetirinery")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    listOfMyBookings = snapshot.docs
        .map((e) => BookAppoinmentModel.fromjson(e.data()))
        .toList();
  }

  List<BookAppoinmentModel> listOfAllBookings = [];
  fetchAllBookings() async {
    final snapshot = await db.collection("Appoinment to vetirinery").get();
    listOfAllBookings = snapshot.docs
        .map((e) => BookAppoinmentModel.fromjson(e.data()))
        .toList();
  }

  Future addMedicines(AddMedicines addMedicines) async {
    final docs = db.collection("Medicines").doc();
    docs.set(addMedicines.toJson(docs.id));
  }

  List<AddMedicines> medicinesList = [];
  Future getAllMedicines() async {
    final snapshot = await db.collection("Medicines").get();
    medicinesList =
        snapshot.docs.map((e) => AddMedicines.fromJson(e.data())).toList();
  }

  deletMedicines(id) async {
    await db.collection("Medicines").doc(id).delete();
    notifyListeners();
  }

  Future addMissingFoundMessage(
      missingId, FoundMissingModel foundMissingModel) async {
    db
        .collection("Missing Found")
        .doc(missingId)
        .set(foundMissingModel.toJson());
  }

  Future foundMissingReport(id) async {
    await db.collection("Missing reports").doc(id).delete();
    notifyListeners();
  }

  FoundMissingModel? myFoundReport;

  fetchIfFoundEnyOneMyPet(id) async {
    final snaps = await db.collection("Missing Found").doc(id).get();
    if (snaps.exists) {
      myFoundReport = FoundMissingModel.fromjson(snaps.data()!);
    }
  }

  afetrPayemt(PaymentModel paymentModel) async {
    final docs = db.collection("Donations").doc();
    docs.set(paymentModel.toJson(docs.id));
  }
}
