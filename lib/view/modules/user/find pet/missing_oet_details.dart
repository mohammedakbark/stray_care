import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stray_care/model/user_report_missing_model.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

class MissingPetDetailPage extends StatelessWidget {
  ReportMissingModel? reportMissingModel;
  MissingPetDetailPage({super.key, required this.reportMissingModel});

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
                reportMissingModel!.imgUrl,
              ),
            ),
            Text(
              reportMissingModel!.name,
              style: const TextStyle(
                  color: CustomColors.buttonColor1,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reportMissingModel!.description,
                  style: const TextStyle(
                      color: CustomColors.buttonColor1,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Text(
                  "Missing date: ${reportMissingModel!.date}",
                  style: const TextStyle(
                      color: CustomColors.buttonColor1,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Text(
                  "Missing from: ${reportMissingModel!.place}",
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
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(94, 220, 176, 0.612)),
                  child: const Text(
                    "Found",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
