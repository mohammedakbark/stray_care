import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_care/view/const/helper.dart';
import 'package:stray_care/view/login_selection.dart';
import 'package:stray_care/view/modules/authorites/authority_home.dart';
import 'package:stray_care/view/modules/user/user_home.dart';
import 'package:stray_care/view/modules/veterinary/veterinary_home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        if (FirebaseAuth.instance.currentUser == null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginSelection()),
              (route) => false);
        }else{
          if(FirebaseAuth.instance.currentUser!.uid==Helper.policeId){
              Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AuthorityHome()),
              (route) => false);
            
          }else if(FirebaseAuth.instance.currentUser!.uid==Helper.forestId){
             Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AuthorityHome()),
              (route) => false);
          }else if(FirebaseAuth.instance.currentUser!.uid==Helper.vetirineryId){
             Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => VeterinaryHome()),
              (route) => false);
          }else{
             Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => UserHome()),
              (route) => false);
          }
        }
      },
    );
    return Scaffold(
      body: Center(
        child:  Text(
                  "Stray Care",
                  style: GoogleFonts.poppins(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
      ),
    );
  }
}
