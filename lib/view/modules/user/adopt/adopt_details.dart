import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/view/const/custom_button.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';
import 'package:stray_care/view/modules/user/adopt/adopt_date_confirm.dart';

class AdoptDetails extends StatefulWidget {
  const AdoptDetails({super.key});

  @override
  State<AdoptDetails> createState() => _AdoptDetailsState();
}

class _AdoptDetailsState extends State<AdoptDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(color: CustomColors.buttonColor2),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Color: Brown",
                    style: TextStyle(
                        color: CustomColors.buttonColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Draft type",
                    style: TextStyle(
                        color: CustomColors.buttonColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Collected on: 20/2/2023",
                    style: TextStyle(
                        color: CustomColors.buttonColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Collected from: Angadippuram",
                    style: TextStyle(
                        color: CustomColors.buttonColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          buttonColor: CustomColors.buttonColor1,
                          text: "Adopt",
                          onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdoptDateConfirm()));
                          })),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatButton(),
    );
  }
}
