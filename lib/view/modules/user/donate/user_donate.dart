import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

class UserDonate extends StatelessWidget {
  const UserDonate({super.key});

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
              Container(
                color: CustomColors.buttonColor1,
                height: 80,
                width: 80,
                child: Icon(CupertinoIcons.building_2_fill, size: 60,),
              ),
              Text(
                "Net Banking",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                color: CustomColors.buttonColor2,
                height: 80,
                width: 80,
                child: Icon(Icons.double_arrow_outlined, size: 60,),
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
