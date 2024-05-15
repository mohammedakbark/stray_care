import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/controller/user_controller.dart';
import 'package:stray_care/model/user_model.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

import '../../const/custom_colors.dart';

class UserReportMissing extends StatelessWidget {
  const UserReportMissing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
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
                      child: TextButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserMyReports()));
                          },
                          child: const Text(
                            "Upload image",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                    hintText: "Select Category", border: OutlineInputBorder()),
                items: UserController.animalType.map((e) {
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged: (value) {}),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: "Description or Identification",
                  hintStyle: TextStyle(),
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
              decoration: InputDecoration(
                  hintText: "Location",
                  hintStyle: TextStyle(),
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
                      child: TextButton(
                          onPressed: () {
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
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
