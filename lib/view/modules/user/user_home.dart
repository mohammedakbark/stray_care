import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stray_care/view/about_us.dart';
import 'package:stray_care/view/const/custom_button.dart';
import 'package:stray_care/view/login_selection.dart';
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
       UserDonate(),
      UserBooking(),
      const BookingAndMedicinesView(),
      const AboutUs(),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(20, 10, 0, 0),
                    items: [
                      PopupMenuItem(
                          onTap: () {
                            FirebaseAuth.instance.signOut().then((value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => LoginSelection()),
                                  (route) => false);
                            });
                          },
                          child: Text("Logout"))
                    ]);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
            itemCount: buttonName.length,
            itemBuilder: (context, index) {
              return CustomButton(
                  buttonColor: CustomColors.buttonColor1,
                  text: buttonName[index],
                  onPress: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => routes[index])));
            }),
      ),
    );
  }
}
