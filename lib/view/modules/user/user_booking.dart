import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stray_care/view/const/custom_button.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

class UserBooking extends StatelessWidget {
  UserBooking({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bookings",
              style: TextStyle(fontSize: 30, color: CustomColors.buttonColor1),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                  hintStyle: TextStyle(color: CustomColors.buttonColor1)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Place",
                  hintStyle: TextStyle(color: CustomColors.buttonColor1)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Token Number",
                  hintStyle: TextStyle(color: CustomColors.buttonColor1)),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        buttonColor: CustomColors.buttonColor1,
                        text: "Book Now",
                        onPress: () {})),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
