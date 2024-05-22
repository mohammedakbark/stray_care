import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/view/modules/veterinary/profile.dart';
import 'package:stray_care/view/modules/veterinary/add_medicines.dart';
import 'package:stray_care/view/modules/veterinary/veterinary_appoinment_list.dart';

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
                      builder: (context) => const VetirineryProfile()));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VetirineryProfile()));
              },
              icon: Icon(
                Icons.person,
                size: 30,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:
              Consumer<UserDBController>(builder: (context, controller, child) {
            return FutureBuilder(
                future: controller.getAllIncident(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = controller.listOfIncidents;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ExpansionTile(
                            title: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black45)),
                                    height: 200,
                                    width: double.infinity,
                                    child: Image.network(
                                        fit: BoxFit.fill,
                                        data[index].imageUrl)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data[index].description,
                                  style: TextStyle(
                                      color: CustomColors.buttonColor1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            children: [
                              Text(
                                "Type of Incident: ${data[index].typeOfAnimal}",
                                style: TextStyle(
                                    color: CustomColors.buttonColor1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Collected From: ${data[index].collectedPlace}",
                                style: TextStyle(
                                    color: CustomColors.buttonColor1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Collected Date: ${data[index].dateTime}",
                                style: TextStyle(
                                    color: CustomColors.buttonColor1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      });
                });
          })),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
