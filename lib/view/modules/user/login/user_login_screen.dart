import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/controller.dart';
import 'package:stray_care/view/const/cheary_toast.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/helper.dart';
import 'package:stray_care/view/modules/user/login/user_signup_screen.dart';

class UserLoginScreen extends StatefulWidget {
  UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  var mobileNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Helper.h(context) * .1,
                ),
                Icon(
                  Iconsax.verify_outline,
                  color: CustomColors.buttonColor1,
                  size: 200,
                ),
                const Text(
                  "Verification",
                  style: TextStyle(
                      fontSize: 44,
                      color: CustomColors.buttonColor1,
                      fontWeight: FontWeight.w500),
                ),

                userController.isShowotpField
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "You will get a OTP via SMS",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Center(
                            child: OTPTextField(
                              controller: userController.otpBox,
                              length: 6,
                              width: Helper.w(context) * .8,
                              fieldWidth: 40,
                              otpFieldStyle: OtpFieldStyle(
                                focusBorderColor: CustomColors.buttonColor1,
                              ),
                              style: const TextStyle(fontSize: 17),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.box,
                              onChanged: (value) {},
                              onCompleted: (value) {
                                print("OTP TextField");
                                userController.verifyOtp(value, context);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          userController.showIndicator
                              ? CircularCountDownTimer(
                                  isReverse: false,
                                  autoStart: userController.startCountDown,
                                  width: 50,
                                  height: 50,
                                  duration: 59,
                                  fillColor: Colors.white,
                                  ringColor: CustomColors.buttonColor1)
                              : SizedBox()
                          // userController.showIndicator
                          //     ? CircularProgressIndicator.adaptive()
                          //     : SizedBox()
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "We will send you a One Time Password on your phone number",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              userController.checkMobileNumberLength(
                                  value, context);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter mobile number";
                              } else {
                                return null;
                              }
                            },
                            controller: mobileNumberController,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: CustomColors.buttonColor1),
                              ),
                              prefix: Text(
                                "+91 ",
                              ),
                              prefixStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          userController.showIndicator
                              ? CircularProgressIndicator.adaptive()
                              : SizedBox()
                        ],
                      ),

                //               SizedBox(
                //                 width: ResponsiveHelper.getWidth(context) * .4,
                //                 height: 60,
                //                 child: ElevatedButton(
                //                     style: ElevatedButton.styleFrom(
                //                         backgroundColor: CustomColors.buttonColor1),
                //                     onPressed: () {
                //                       // if (_formKey.currentState!.validate()) {
                //                       userController.showOtpField();
                // //9446388675

                //                       // }
                //                     },
                //                     child: const Text("Genarate OTP",
                //                         style: TextStyle(color: Colors.white, fontSize: 18))),
                //               ),
                //               const SizedBox(
                //                 height: 20,
                //               ),
                // userController.isShowotpField
                //     ? const SizedBox()
                //     : Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           const Text(
                //             "Don't have an account ?",
                //             style: TextStyle(fontSize: 15, color: Colors.grey),
                //           ),
                //           TextButton(
                //               onPressed: () {
                //                 Navigator.of(context).push(MaterialPageRoute(
                //                   builder: (context) =>
                //                       const UserSignUpScreen(),
                //                 ));
                //               },
                //               child: const Text(
                //                 "Create new account",
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 15,
                //                 ),
                //               ))
                //         ],
                //       )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
