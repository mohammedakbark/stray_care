import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/controller.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/model/user_reportincedent_model.dart';
import 'package:stray_care/view/const/cheary_toast.dart';
import 'package:stray_care/view/const/helper.dart';
import 'package:stray_care/view/modules/user/user_report_details.dart';

import '../../../const/custom_colors.dart';

class UserReportIncident extends StatefulWidget {
  const UserReportIncident({super.key});

  @override
  State<UserReportIncident> createState() => _UserReportIncidentState();
}

class _UserReportIncidentState extends State<UserReportIncident> {
  final descriptionController = TextEditingController();
  final placeController = TextEditingController();
  String category = "";
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<UserController>(
                        builder: (context, imageController, child) {
                      return imageController.pickedFile != null
                          ? SizedBox(
                              height: Helper.h(context) * .3,
                              child: Image.file(
                                imageController.pickedFile!,
                              ),
                            )
                          : const SizedBox();
                    }),

                    Consumer<UserController>(
                        builder: (context, imageController, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              imageController.pickeImageFromGallery();
                            },
                            icon: const Icon(
                              Icons.photo,
                              color: Colors.blueAccent,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                imageController.pickeImageFromCamera();
                              },
                              icon: const Icon(
                                CupertinoIcons.camera,
                                color: Colors.blueAccent,
                              ))
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter place";
                        } else {
                          return null;
                        }
                      },
                      controller: placeController,
                      textCapitalization: TextCapitalization.sentences,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                          labelText: "Place",
                          labelStyle: TextStyle(),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // ExpansionTile(
                    //   title: Text("Select "),
                    //   children: animalType.map((e) {
                    //     return Text(e);
                    //   }).toList(),
                    // ),
                    DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Select category";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: "Select Category",
                            border: OutlineInputBorder()),
                        items: UserController.animalType.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (value) {
                          category = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Description";
                        } else {
                          return null;
                        }
                      },
                      controller: descriptionController,
                      textCapitalization: TextCapitalization.sentences,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                          labelText: "Add description",
                          labelStyle: TextStyle(),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Consumer<UserDBController>(
                              builder: (context, dbController, child) {
                            return
                                // dbController.isImageLoading
                                //     ? const Center(
                                //         child: CircularProgressIndicator(),
                                //       )
                                //     :
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: CustomColors.buttonColor1),
                                    child: Consumer<UserController>(
                                        builder: (context, controller, child) {
                                      return TextButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              if (controller.pickedFile !=
                                                  null) {
                                                dbController
                                                    .storeImage(
                                                        Provider.of<UserController>(
                                                                context,
                                                                listen: false)
                                                            .pickedFile!,
                                                        "incident")
                                                    .then((value) {
                                                  print(value);
                                                  if (value != null) {
                                                    dbController
                                                        .reportNewIncident(
                                                            ReportIncidentModel(
                                                                adoptionOption:
                                                                    false,
                                                                collectedPlace:
                                                                    placeController
                                                                        .text,
                                                                dateTime: date,
                                                                description:
                                                                    descriptionController
                                                                        .text,
                                                                imageUrl: value,
                                                                typeOfAnimal:
                                                                    category,
                                                                uid: FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid))
                                                        .then((value) {
                                                      Provider.of<UserController>(
                                                              context,
                                                              listen: false)
                                                          .clearPicker();

                                                      Navigator.of(context)
                                                          .pop();
                                                      ToastMessage.successToast(
                                                          context,
                                                          "Reporting incident is scuccesful !");
                                                    });
                                                  } else {
                                                    ToastMessage.errorToast(
                                                        context,
                                                        "Error,reporting incident !");
                                                  }
                                                });
                                              } else {
                                                ToastMessage.warningToast(
                                                    context,
                                                    "Warning !.pick image before submit");
                                              }
                                            }
                                          },
                                          child: const Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ));
                                    }));
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<UserController>(context, listen: false).clearPicker();

          Navigator.pop(context);
        },
        child: const Icon(
          CupertinoIcons.back,
          color: Colors.white,
          size: 60,
        ),
        backgroundColor: CustomColors.buttonColor1,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
