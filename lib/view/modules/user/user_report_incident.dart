import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/controller/user_controller.dart';
import 'package:stray_care/view/modules/user/user_report_details.dart';

import '../../const/custom_colors.dart';

class UserReportIncident extends StatefulWidget {
  const UserReportIncident({super.key});

  @override
  State<UserReportIncident> createState() => _UserReportIncidentState();
}

class _UserReportIncidentState extends State<UserReportIncident> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.camera,
                        color: Colors.blueAccent,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.photo,
                          color: Colors.blueAccent,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // ExpansionTile(
                //   title: Text("Select "),
                //   children: animalType.map((e) {
                //     return Text(e);
                //   }).toList(),
                // ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                        hintText: "Select Category",
                        border: OutlineInputBorder()),
                    items: UserController.animalType.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {}),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                      labelText: "Add description",
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder()),
                ),
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
                          child: TextButton(
                              onPressed: () {
                               
                              },
                              child: const Text(
                                "Submit",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
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
