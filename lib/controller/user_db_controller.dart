import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
        // .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
    searchResult = List.from(listOfIncidents);

    searchResult = listOfIncidents.where((element) {
      return element.collectedPlace
          .toLowerCase()
          .contains(searchElement.toLowerCase());
    }).toList();
    notifyListeners();
  }
}
