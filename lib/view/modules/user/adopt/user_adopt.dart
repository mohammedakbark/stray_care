import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';
import 'package:stray_care/view/modules/user/adopt/adopt_details.dart';

class UserAdopt extends StatelessWidget {
  const UserAdopt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child:
            Consumer<UserDBController>(builder: (context, dbController, child) {
          return Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  dbController.searchData(value);
                },
                decoration: const InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(),
                    icon: Icon(
                      CupertinoIcons.search,
                      color: CustomColors.buttonColor1,
                      size: 30,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                    future: dbController.getAdoptableAnimals(),
                    builder: (context, snapshot) {
                      final data = dbController.searchResult.isNotEmpty
                          ? dbController.searchResult
                          : dbController.adoptableList;
                      return data.isEmpty
                          ? const Center(
                              child: Text("No Data"),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  child: Column(
                                    children: [
                                      Text(
                                        data[index].collectedPlace,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AdoptDetails(
                                                            reportIncidentModel:
                                                                data[index],
                                                          )));
                                            },
                                            child: Image.network(
                                              data[index].imageUrl,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Description: ${data[index].description}",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                    }),
              )
            ],
          );
        }),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
