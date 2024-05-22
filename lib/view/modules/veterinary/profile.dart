import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stray_care/view/modules/veterinary/add_medicines.dart';
import 'package:stray_care/view/modules/veterinary/medicines_list.dart';
import 'package:stray_care/view/modules/veterinary/veterinary_appoinment_list.dart';
import 'package:stray_care/view/splash_screen.dart';

class VetirineryProfile extends StatelessWidget {
  const VetirineryProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            MyButton(
              name: "Appoinments",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VeterinaryAppoinmentList()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              name: "Add Medicines",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VeterinaryAddMedicines()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              name: "Medicines",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VetirineryMedicineList()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              icon: Icons.logout,
              name: "Logout",
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (conetext) => SplashScreen()),
                        (route) => false));
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  String name;
  IconData? icon;
  void Function()? onTap;

  MyButton({super.key, required this.name, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 177, 205, 252),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Icon(icon ?? Icons.arrow_forward_ios_sharp)
          ],
        ),
      ),
    );
  }
}
