import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';

import '../../const/custom_float_button.dart';

class VeterinaryAppoinmentList extends StatelessWidget {
  const VeterinaryAppoinmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text(
              "My Appoinmentes",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<UserDBController>(builder: (context, controller, child) {
              return FutureBuilder(
                  future: controller.fetchAllBookings(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final data = controller.listOfAllBookings;
                    return Expanded(
                      child: data.isEmpty
                          ? const Center(
                              child: Text("No Bookings"),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: SizedBox(
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor: Colors.grey,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[index].name,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(data[index].place)
                                            ],
                                          ),
                                          Text(data[index].appoinmentDate)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                    );
                  });
            }),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
