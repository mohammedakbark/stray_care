import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/view/about_us.dart';
import 'package:stray_care/view/const/custom_button.dart';
import 'package:stray_care/view/modules/user/booking/booking_and_medicines.dart';
import 'package:stray_care/view/modules/user/adopt/user_adopt.dart';
import 'package:stray_care/view/modules/user/booking/user_booking.dart';
import 'package:stray_care/view/modules/user/donate/user_donate.dart';
import 'package:stray_care/view/modules/user/find%20pet/user_find_pet.dart';
import 'package:stray_care/view/modules/user/find%20pet/user_report_incident.dart';

import '../../const/custom_colors.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    List<String> buttonName = [
      "Report Incident",
      "Find your pet",
      "Adopt",
      "Donate",
      "Book Doctor",
      "Booking and Medicines",
      "About Us"
    ];

    List<Widget> routes = [
      const UserReportIncident(),
      const UserFindPet(),
      const UserAdopt(),
      const UserDonate(),
      UserBooking(),
      const BookingAndMedicinesView(),
      const AboutUs(),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 250,
                height: 500,
                child: ListView.builder(
                    itemCount: buttonName.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    buttonColor: CustomColors.buttonColor1,
                                    text: buttonName[index],
                                    onPress: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                routes[index]))),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
