import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/model/adoption_notification_model.dart';
import 'package:stray_care/model/user_reportincedent_model.dart';

import '../../../const/custom_button.dart';
import '../../../const/custom_colors.dart';
import '../../../const/custom_float_button.dart';

class AdoptDateConfirm extends StatefulWidget {
  ReportIncidentModel reportIncidentModel;

  AdoptDateConfirm({super.key, required this.reportIncidentModel});

  @override
  State<AdoptDateConfirm> createState() => _AdoptDateConfirmState();
}

class _AdoptDateConfirmState extends State<AdoptDateConfirm> {
  TextEditingController contctNumberC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserDBController>(builder: (context, dbController, child) {
        return Center(
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              widget.reportIncidentModel.imageUrl)),
                      color: CustomColors.buttonColor2),
                ),
                const SizedBox(
                  height: 30,
                ),
                // locationOn
                //     ?

                // : const Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Arrive at",
                //         style: TextStyle(
                //             color: CustomColors.buttonColor1,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20),
                //       ),
                //       Spacer(),
                //       Icon(
                //         Icons.location_on,
                //         color: CustomColors.buttonColor1,
                //       )
                //     ],
                //   )

                FutureBuilder(
                    future: dbController.checkTheAnimalIsAlreadyAdopted(
                        widget.reportIncidentModel.incidentId),
                    builder: (context, snapshor) {
                      if (snapshor.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return dbController.isTheAdoptedUserHim
                          ? const Text(
                              "Your Request is Confirmed!",
                              style: TextStyle(
                                  color: CustomColors.buttonColor1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                          : dbController.isAnimalalreadyAdopted
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Someone already requested!",
                                      style: TextStyle(
                                          color: CustomColors.buttonColor1,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "When will you pick up",
                                          style: TextStyle(
                                              color: CustomColors.buttonColor1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            showDatePicker(
                                                    initialDate: DateTime.now(),
                                                    context: context,
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(2050))
                                                .then((value) {
                                              selectedDate = value!;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.calendar_month_outlined,
                                            color: CustomColors.buttonColor1,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Form(
                                          key: _formKey,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Contact number is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: contctNumberC,
                                            keyboardType: TextInputType.number,
                                            maxLength: 10,
                                            decoration: const InputDecoration(
                                              hintText: "Contact No.",
                                              hintStyle: TextStyle(
                                                  color:
                                                      CustomColors.buttonColor1,
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                    // :
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    //   children: [
                                    //     Text(
                                    //       "Confirmed",
                                    //       style: TextStyle(
                                    //           color: CustomColors.buttonColor1,
                                    //           fontWeight: FontWeight.bold,
                                    //           fontSize: 20),
                                    //     ),
                                    //     Spacer(),
                                    //     InkWell(
                                    //       onTap: () {},
                                    //       child: Icon(
                                    //         Icons.check,
                                    //         color: CustomColors.buttonColor1,
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    // locationOn
                                    //     ?
                                    Row(
                                      children: [
                                        Expanded(
                                            child: CustomButton(
                                                buttonColor:
                                                    CustomColors.buttonColor1,
                                                text: "Confirm",
                                                onPress: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    if (selectedDate != null) {
                                                      dbController
                                                          .makeAdoption(
                                                              AdoptionNotificationModel(
                                                                  contactNumber:
                                                                      int.parse(
                                                                          contctNumberC
                                                                              .text),
                                                                  reportIncidentModel:
                                                                      widget
                                                                          .reportIncidentModel,
                                                                  collectiondate:
                                                                      selectedDate
                                                                          .toString(),
                                                                  adoptionRequestDate:
                                                                      DateTime.now()
                                                                          .toString(),
                                                                  uid: FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .uid),
                                                              widget
                                                                  .reportIncidentModel
                                                                  .incidentId)
                                                          .then((value) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    "Request is completed,we will contact you soon")));
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      "Pick up date is not selected")));
                                                    }
                                                  }
                                                })),
                                      ],
                                    )
                                  ],
                                );
                    })
              ],
            ),
          ),
        );
      }),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
