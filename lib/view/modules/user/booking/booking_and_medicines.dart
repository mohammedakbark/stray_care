import 'package:flutter/material.dart';
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
              TabBar(tabs: [
                Tab(
                  child: Text("Bookings"),
                ),
                Tab(
                  child: Text("Medicines"),
                )
              ]),
              Expanded(
                child: TabBarView(children: [
                  ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const UserMedicines(),
                            // ));
                          },
                          leading: Text("${index + 1}"),
                          subtitle: Text("Booked"),
                          trailing: Text("12/02/23"),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          endIndent: 60,
                          thickness: 2,
                          indent: 60,
                        );
                      },
                      itemCount: 6),
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
                ]),
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
