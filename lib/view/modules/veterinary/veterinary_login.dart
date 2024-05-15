import 'package:flutter/material.dart';
import 'package:stray_care/view/modules/veterinary/veterinary_home.dart';

import '../../const/custom_button.dart';
import '../../const/custom_colors.dart';

class VeterinaryLogin extends StatefulWidget {
  const VeterinaryLogin({super.key});

  @override
  State<VeterinaryLogin> createState() => _VetarinaryLoginState();
}

class _VetarinaryLoginState extends State<VeterinaryLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      hintText: "ID",
                      hintStyle: TextStyle(color: CustomColors.buttonColor1)
                  ),
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: CustomColors.buttonColor1)
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(child: CustomButton(buttonColor: CustomColors.buttonColor1, text: "Login", onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const VeterinaryHome()));
                    })),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
