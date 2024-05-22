import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/controller.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/model/user_model.dart';
import 'package:stray_care/model/user_report_missing_model.dart';
import 'package:stray_care/view/const/cheary_toast.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

import '../../const/custom_colors.dart';

class UserReportMissing extends StatelessWidget {
  UserReportMissing({super.key});
  final locationController = TextEditingController();
  final desCriptionController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: CustomColors.buttonColor1),
                        child: Consumer<UserController>(
                            builder: (context, userController, child) {
                          return TextButton(
                              onPressed: () {
                                userController
                                    .pickeImageFromGallery()
                                    .then((value) {
                                  if (userController.pickedFile != null) {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: const BeveledRectangleBorder(),
                                          title: Image.file(
                                              userController.pickedFile!),
                                          actions: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: CustomColors
                                                              .buttonColor1),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            ToastMessage
                                                                .successToast(
                                                                    context,
                                                                    "Image is selected");
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                            "Select Image",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    ToastMessage.errorToast(
                                        context, "Image not selected");
                                  }
                                });
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserMyReports()));
                              },
                              child: const Text(
                                "Upload image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ));
                        })),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // DropdownButtonFormField(
              //     decoration: const InputDecoration(
              //         hintText: "Select Category", border: OutlineInputBorder()),
              //     items: UserController.animalType.map((e) {
              //       return DropdownMenuItem(
              //         child: Text(e),
              //         value: e,
              //       );
              //     }).toList(),
              //     onChanged: (value) {}),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field is required";
                  } else {
                    return null;
                  }
                },
                controller: nameController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: const TextStyle(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field is required";
                  } else {
                    return null;
                  }
                },
                controller: desCriptionController,
                textInputAction: TextInputAction.next,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    hintText: "Description or Identification",
                    hintStyle: const TextStyle(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(30),
              //               color: CustomColors.buttonColor1),
              //           child: TextButton(
              //               onPressed: () {
              //                 // Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserReportAddDetails()));
              //               },
              //               child: const Text(
              //                 "Location",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold),
              //               ))),
              //     ),
              //   ],
              // ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field is required";
                  } else {
                    return null;
                  }
                },
                controller: locationController,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: "Location",
                    hintStyle: const TextStyle(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: CustomColors.buttonColor1),
                        child: Consumer<UserDBController>(
                            builder: (context, dbController, child) {
                          return TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (Provider.of<UserController>(context,
                                              listen: false)
                                          .pickedFile !=
                                      null) {
                                    dbController
                                        .storeImage(
                                            Provider.of<UserController>(context,
                                                    listen: false)
                                                .pickedFile!,
                                            "Missing")
                                        .then((url) {
                                      dbController
                                          .reportMissing(ReportMissingModel(
                                              date: date,
                                              description:
                                                  desCriptionController.text,
                                              imgUrl: url!,
                                              name: nameController.text,
                                              place: locationController.text,
                                              reportStatus: "Reported",
                                              uid: FirebaseAuth
                                                  .instance.currentUser!.uid))
                                          .then((value) {
                                        Provider.of<UserController>(context,
                                                listen: false)
                                            .clearPicker();
                                        ToastMessage.successToast(context,
                                            "Missing successfully reported");
                                        Navigator.of(context).pop();
                                      });
                                    });
                                  } else {
                                    ToastMessage.warningToast(context,
                                        "Select image before submit !");
                                  }
                                }
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserReportAddDetails()));
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ));
                        })),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
