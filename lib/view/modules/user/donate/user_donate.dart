import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';
import 'package:stray_care/view/modules/user/payment.dart';

class UserDonate extends StatelessWidget {
  UserDonate({super.key});
  final amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   color: CustomColors.buttonColor1,
            //   height: 80,
            //   width: 80,
            //   child: Icon(CupertinoIcons.building_2_fill, size: 60,),
            // ),
            // Text(
            //   "Net Banking",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(
            //   height: 100,
            // ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: TextFormField(
                            controller: amount,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(label: Text("Amount")),
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: CustomColors.buttonColor2,
                                ),
                                onPressed: () {
                                  if (amount.text.isNotEmpty) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => PaymentPage(
                                                amount: double.parse(
                                                    amount.text))));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Enter the amount")));
                                  }
                                },
                                child: Text(
                                  "Confirm Payement",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ));
              },
              child: Container(
                color: CustomColors.buttonColor2,
                height: 80,
                width: 80,
                child: Icon(
                  Icons.double_arrow_outlined,
                  size: 60,
                ),
              ),
            ),
            Text(
              "UPI",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
