import 'package:flutter/material.dart';

class VetirineryMedicineList extends StatelessWidget {
  const VetirineryMedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
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
    );
  }
}
