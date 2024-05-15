import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/custom_colors.dart';

class UserReportDetails extends StatefulWidget {
  const UserReportDetails({super.key});

  @override
  State<UserReportDetails> createState() => _UserReportDetailsState();
}

class _UserReportDetailsState extends State<UserReportDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.forest_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Description"),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: CustomColors.buttonColor1),
                        child: TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.phone_in_talk,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  const Text(
                                    "Call Vet",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pop(context);},
        child: Icon(
          CupertinoIcons.back,
          color: Colors.white,
          size: 60,
        ),
        backgroundColor: CustomColors.buttonColor1,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
