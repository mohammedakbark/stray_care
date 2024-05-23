import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';
import 'package:stray_care/view/const/helper.dart';
import 'package:stray_care/view/splash_screen.dart';

class AuthorityHome extends StatefulWidget {
  const AuthorityHome({super.key});

  @override
  State<AuthorityHome> createState() => _AuthorityHomeState();
}

class _AuthorityHomeState extends State<AuthorityHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // centerTitle: true,
        // title: const Text(
        //   "Report Collected !",
        //   style: TextStyle(
        //       color: CustomColors.buttonColor1,
        //       fontSize: 25,
        //       fontWeight: FontWeight.bold),
        // ),
        centerTitle: true,
        title: Text(
          FirebaseAuth.instance.currentUser!.uid == Helper.policeId
              ? "POLICE"
              : "FOREST",
          style: TextStyle(
              fontSize: 22, color: Color.fromARGB(255, 198, 181, 124)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                      (route) => false);
                });
              },
              icon: Icon(Icons.logout)),
          
        ],
      ),
      body: Column(
        children: [
          Text(
            "Report Collected !",
            style: TextStyle(
                color: CustomColors.buttonColor1,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Consumer<UserDBController>(
                    builder: (context, controller, child) {
                  return FutureBuilder(
                      future: controller.getAllIncident(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final data = controller.listOfIncidents;
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ExpansionTile(
                                  title: Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45)),
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
          ),
        ],
      ),
    );
  }
}
