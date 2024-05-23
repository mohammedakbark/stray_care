import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';

class VetirineryMedicineList extends StatelessWidget {
  const VetirineryMedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "List Of Medicines",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Consumer<UserDBController>(
                builder: (context, controller, child) {
              return FutureBuilder(
                  future: controller.getAllMedicines(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final data = controller.medicinesList;
                    return data.isEmpty
                        ? Center(
                            child: Text("No Medicines"),
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
                                title: Text(data[index].medicineName),
                                subtitle: Text(data[index].usage),
                                trailing: IconButton(
                                    onPressed: () {
                                      controller.deletMedicines(
                                          data[index].medicineID);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: const Color.fromARGB(
                                          255, 226, 141, 135),
                                    )),
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
                  });
            }),
          ),
        ],
      ),
    );
  }
}
