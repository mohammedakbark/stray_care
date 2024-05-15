import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,),
        body:   const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About Us", style: TextStyle(color: CustomColors.buttonColor1,fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("We are a group of animal lovers who are concerned about animals which lacks proper care. We are here to bridge those animals and the kind human souls.", style: TextStyle(color: CustomColors.buttonColor1,fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
