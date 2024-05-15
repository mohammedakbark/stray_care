import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_controller.dart';
import 'package:stray_care/view/modules/authorites/authority_login.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/modules/user/user_login_screen.dart';
import 'package:stray_care/view/modules/user/user_signup_screen.dart';
import 'package:stray_care/view/modules/veterinary/veterinary_login.dart';

class LoginSelection extends StatelessWidget {
  const LoginSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Stray Care",
                  style: GoogleFonts.poppins(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColors.buttonColor1),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                      child: Text(
                        "Login as:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: CustomColors.buttonColor1),
                          child: Consumer<UserController>(
                              builder: (context, obj, child) {
                            return TextButton(
                                onPressed: () {
                                  obj.showOtpField();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserLoginScreen()));
                                },
                                child: Text(
                                  "User (Public)",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ));
                          })),
                    ),
                  ],
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
                //               onPressed: () {},
                //               child: Text(
                //                 "StrayCare Office",
                //                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                //               ))),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: CustomColors.buttonColor1),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthorityLogin()));
                              },
                              child: Text(
                                "Authorities",
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: CustomColors.buttonColor1),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VeterinaryLogin()));
                              },
                              child: Text(
                                "Veterinary",
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
        ),
      ),
    );
  }
}
