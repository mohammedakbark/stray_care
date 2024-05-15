import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

import '../../const/custom_button.dart';

class UserMedicines extends StatelessWidget {
  const UserMedicines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Text(
              "Medicines",
              style: TextStyle(fontSize: 30, color: CustomColors.buttonColor1),
            ),
            ListView.separated(
                // physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(
                    "Aspirin",
                    style: TextStyle(
                      fontSize: 17,
                      color: CustomColors.buttonColor1,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: 2),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
