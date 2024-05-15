import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/model/user_reportincedent.dart';

class UserDBController with ChangeNotifier {
  final db = FirebaseFirestore.instance;
//-- create

  Future reportNewIncident(ReportIncidentModel reportIncidentModel) async {
    final doc = db.collection("New Incident").doc();
    doc.set(reportIncidentModel.toJson(doc.id));
  }

//-- update

//-- delete

//-- update
}
