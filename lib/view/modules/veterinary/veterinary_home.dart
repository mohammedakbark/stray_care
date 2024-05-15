import 'package:flutter/material.dart';
import 'package:stray_care/view/modules/veterinary/veterinary_report.dart';
import 'package:stray_care/view/modules/veterinary/veterinary_report_list.dart';

import '../../const/custom_colors.dart';
import '../../const/custom_float_button.dart';

class VeterinaryHome extends StatefulWidget {
  const VeterinaryHome({super.key});

  @override
  State<VeterinaryHome> createState() => _VeterinaryHomeState();
}

class _VeterinaryHomeState extends State<VeterinaryHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VeterinaryReport()));
            },
            child: Text(
              "Report Collected !",
              style: TextStyle(
                  color: CustomColors.buttonColor1,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const VeterinaryReportList()));
              },
              icon: Icon(
                Icons.person,
                size: 30,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45)),
                        height: 200,
                        child: Center(
                          child: Text("Incident Photo"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            color: CustomColors.buttonColor1,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              })),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
