import 'package:flutter/material.dart';

import '../../const/custom_button.dart';
import '../../const/custom_colors.dart';
import '../../const/custom_float_button.dart';

class AdoptDateConfirm extends StatefulWidget {
  const AdoptDateConfirm({super.key});

  @override
  State<AdoptDateConfirm> createState() => _AdoptDateConfirmState();
}

class _AdoptDateConfirmState extends State<AdoptDateConfirm> {

  bool locationOn= true;

  void onPress(){
    setState(() {
      locationOn= false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(color: CustomColors.buttonColor2),
              ),
              const SizedBox(height: 30,),
              locationOn?
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("When will you pick up",  style:  TextStyle(color: CustomColors.buttonColor1, fontWeight: FontWeight.bold, fontSize: 20),),
                  Spacer(),
                  Icon(Icons.calendar_month_outlined, color: CustomColors.buttonColor1,)
                ],
              ):
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Confirmed",  style:  TextStyle(color: CustomColors.buttonColor1, fontWeight: FontWeight.bold, fontSize: 20),),
                  Spacer(),
                  Icon(Icons.check, color: CustomColors.buttonColor1,)
                ],
              ),
              const SizedBox(height: 30,),
              locationOn?
              Row(
                children: [
                  Expanded(child: CustomButton(buttonColor: CustomColors.buttonColor1, text: "Confirm", onPress: onPress)),
                ],
              ):
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Arrive at",  style:  TextStyle(color: CustomColors.buttonColor1, fontWeight: FontWeight.bold, fontSize: 20),),
                  Spacer(),
                  Icon(Icons.location_on, color: CustomColors.buttonColor1,)
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
