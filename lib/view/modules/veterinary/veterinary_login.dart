import 'package:flutter/material.dart';
import 'package:stray_care/controller/controller.dart';
import 'package:stray_care/view/modules/veterinary/veterinary_home.dart';

import '../../const/custom_button.dart';
import '../../const/custom_colors.dart';

class VeterinaryLogin extends StatefulWidget {
  const VeterinaryLogin({super.key});

  @override
  State<VeterinaryLogin> createState() => _VetarinaryLoginState();
}

class _VetarinaryLoginState extends State<VeterinaryLogin> {
  final _formKey = GlobalKey<FormState>();
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Email",
                        hintStyle: TextStyle(color: CustomColors.buttonColor1)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: passwordC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: CustomColors.buttonColor1)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                              buttonColor: CustomColors.buttonColor1,
                              text: "Login",
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  UserController().loginWithEmail(
                                      emailC.text.trim(),
                                      passwordC.text.trim(),
                                      context,
                                      "Vetirinery");
                                }
                              })),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
