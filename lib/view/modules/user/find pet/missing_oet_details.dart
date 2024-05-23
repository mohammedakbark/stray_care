import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/model/foundMissingModel.dart';
import 'package:stray_care/model/user_report_missing_model.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

class MissingPetDetailPage extends StatefulWidget {
  ReportMissingModel? reportMissingModel;
  MissingPetDetailPage({super.key, required this.reportMissingModel});

  @override
  State<MissingPetDetailPage> createState() => _MissingPetDetailPageState();
}

class _MissingPetDetailPageState extends State<MissingPetDetailPage> {
  bool show = false;

  final number = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Missing",
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.buttonColor2),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Image.network(
                widget.reportMissingModel!.imgUrl,
              ),
            ),
            Text(
              widget.reportMissingModel!.name,
              style: const TextStyle(
                  color: CustomColors.buttonColor1,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.reportMissingModel!.description,
                  style: const TextStyle(
                      color: CustomColors.buttonColor1,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Text(
                  "Missing date: ${widget.reportMissingModel!.date}",
                  style: const TextStyle(
                      color: CustomColors.buttonColor1,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Text(
                  "Missing from: ${widget.reportMissingModel!.place}",
                  style: const TextStyle(
                      color: CustomColors.buttonColor1,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            show
                ? SizedBox()
                : SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(94, 220, 176, 0.612)),
                        child: const Text(
                          "Found",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
            SizedBox(
              height: 20,
            ),
            show
                ? Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextFormField(
                              controller: number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Mobile number";
                                } else {
                                  return null;
                                }
                              },
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Contact Number"),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                UserDBController()
                                    .addMissingFoundMessage(
                                        widget.reportMissingModel!.missingId,
                                        FoundMissingModel(
                                            contactNumber:
                                                int.parse(number.text.trim()),
                                            missingID: widget
                                                .reportMissingModel!.missingId
                                                .toString(),
                                            uid: FirebaseAuth
                                                .instance.currentUser!.uid))
                                    .then((value) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Successful")));
                                });
                              }
                            },
                            child: Text("Submit"))
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
