import 'package:flutter/material.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/model/add_medicines.dart';

import '../../const/custom_colors.dart';
import '../../const/custom_float_button.dart';

class VeterinaryAddMedicines extends StatefulWidget {
  const VeterinaryAddMedicines({super.key});

  @override
  State<VeterinaryAddMedicines> createState() => _VeterinaryAddMedicinesState();
}

class _VeterinaryAddMedicinesState extends State<VeterinaryAddMedicines> {
  final _frmKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final discription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 250,
            child: Form(
              key: _frmKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name is Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Medicine Name ",
                        labelStyle:
                            const TextStyle(color: CustomColors.buttonColor1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: discription,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field is Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Add Description/Usage",
                        labelStyle:
                            const TextStyle(color: CustomColors.buttonColor1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CustomColors.buttonColor1),
                            child: TextButton(
                                onPressed: () {
                                  if (_frmKey.currentState!.validate()) {
                                    UserDBController()
                                        .addMedicines(AddMedicines(
                                            medicineName: name.text,
                                            usage: discription.text))
                                        .then((value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("New Medicine added")));
                                      Navigator.of(context).pop();
                                    });
                                  }
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserReportAddDetails()));
                                },
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
