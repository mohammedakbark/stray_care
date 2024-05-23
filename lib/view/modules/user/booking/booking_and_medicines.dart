import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/view/const/custom_colors.dart';

class BookingAndMedicinesView extends StatelessWidget {
  const BookingAndMedicinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const TabBar(tabs: [
                Tab(
                  child: Text("Bookings"),
                ),
                Tab(
                  child: Text("Medicines"),
                )
              ]),
              Expanded(
                child: Consumer<UserDBController>(
                    builder: (context, controller, child) {
                  return TabBarView(children: [
                    FutureBuilder(
                        future: controller.fetchMyBookings(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final data = controller.listOfMyBookings;
                          return data.isEmpty
                              ? const Center(
                                  child: Text("No Bookings"),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //   builder: (context) => const UserMedicines(),
                                        // ));
                                      },
                                      leading: Text("${index + 1}"),
                                      subtitle:
                                          const Text("Booking is Succesful"),
                                      trailing: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(data[index].appoinmentDate),
                                          Text(data[index].time)
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      endIndent: 60,
                                      thickness: 2,
                                      indent: 60,
                                    );
                                  },
                                  itemCount: data.length);
                        }),
                    FutureBuilder(
                        future: controller.getAllMedicines(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final data = controller.medicinesList;
                          return ListView.separated(
                              // physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text("${index + 1})"),
                                  title: Text(
                                    data[index].medicineName,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: CustomColors.buttonColor1,
                                    ),
                                  ),
                                  subtitle: Text(
                                    data[index].usage,
                                    // style: TextStyle(
                                    //   fontSize: 17,
                                    //   // color: CustomColors.buttonColor1,
                                    // ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: data.length);
                        }),
                  ]);
                }),
              ),
              // const Text(
              //   "Bookings",
              //   style: TextStyle(fontSize: 30, color: CustomColors.buttonColor1),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
