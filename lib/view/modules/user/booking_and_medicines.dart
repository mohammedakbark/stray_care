import 'package:flutter/material.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/modules/user/user_medicines.dart';

class BookingAndMedicinesView extends StatelessWidget {
  const BookingAndMedicinesView({super.key});

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
              "Bookings",
              style: TextStyle(fontSize: 30, color: CustomColors.buttonColor1),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserMedicines(),
                        ));
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
            ),
          ],
        ),
      ),
    );
  }
}
