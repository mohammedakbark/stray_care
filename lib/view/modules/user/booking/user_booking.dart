import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/model/book_appoinment_model.dart';
import 'package:stray_care/view/const/custom_button.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

class UserBooking extends StatelessWidget {
  UserBooking({super.key});
  final nameController = TextEditingController();
  final placeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Bookings",
                style:
                    TextStyle(fontSize: 30, color: CustomColors.buttonColor1),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name is required";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    hintStyle: TextStyle(color: CustomColors.buttonColor1)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: placeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Palce is required";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Place",
                    hintStyle: TextStyle(color: CustomColors.buttonColor1)),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder()),
                    onPressed: () async {
                      await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050))
                          .then((value) {
                        selectedDate = value!;
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Date"),
                        Icon(Icons.calendar_month)
                      ],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder()),
                    onPressed: () async {
                      await showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) async {
                        selectedTime = value;

                        // log(selectedTime!.period.name);
                        // DateFormat()
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Select Time"), Icon(Icons.timer)],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          buttonColor: CustomColors.buttonColor1,
                          text: "Book Now",
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              if (selectedDate != null &&
                                  selectedTime != null) {
                                UserDBController()
                                    .bookVetirinery(BookAppoinmentModel(
                                  time:
                                      "${selectedTime!.hour}/${selectedTime!.minute} ${selectedTime!.period.name}",
                                  appoinmentDate: DateFormat("dd/MM/yyyy")
                                      .format(selectedDate!),
                                  name: nameController.text,
                                  uid: FirebaseAuth.instance.currentUser!.uid,
                                  place: placeController.text,
                                ))
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Booking is Successful")));
                                });
                                Navigator.of(context).pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Select Date")));
                              }
                            }
                          })),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
