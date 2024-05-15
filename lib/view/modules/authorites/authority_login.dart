import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stray_care/view/modules/authorites/authority_home.dart';
import 'package:stray_care/view/const/custom_button.dart';

import '../../const/custom_colors.dart';

class AuthorityLogin extends StatefulWidget {
  const AuthorityLogin({super.key});

  @override
  State<AuthorityLogin> createState() => _AuthorityLoginState();
}

class _AuthorityLoginState extends State<AuthorityLogin> {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AuthorityHome()));
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
