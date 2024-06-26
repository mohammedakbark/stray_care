import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class UserMyReports extends StatefulWidget {
  const UserMyReports({super.key});

  @override
  State<UserMyReports> createState() => _UserMyReportsState();
}

class _UserMyReportsState extends State<UserMyReports> {
  // bool isShown = true;

  // void onPress() {
  //   setState(() {
  //     isShown = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle:
                        const TextStyle(color: CustomColors.buttonColor1),
                    suffixIcon: const Icon(
                      CupertinoIcons.search,
                      color: CustomColors.buttonColor1,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 20,
              ),

              Expanded(
                child: Consumer<UserDBController>(
                    builder: (context, dbControler, child) {
                  return FutureBuilder(
                      future: dbControler.getOwnMissingReposts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final data = dbControler.listOfOwnMissingReport;
                        return data.isEmpty
                            ? Center(
                                child: Text("Report not found"),
                              )
                            : ListView.separated(
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: 150,
                                            child: Image.network(
                                                data[index].imgUrl)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          content: Text(
                                                              "Confirm if the pet is already found"),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  dbControler.foundMissingReport(
                                                                      data[index]
                                                                          .missingId);
                                                                  final nav =
                                                                      Navigator.of(
                                                                          context);
                                                                  nav.pop();
                                                                  nav.pop();
                                                                },
                                                                child: Text(
                                                                    "Confirm"))
                                                          ],
                                                        ));
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                                child: Text(
                                                  "Found",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        FutureBuilder(
                                          future: dbControler
                                              .fetchIfFoundEnyOneMyPet(
                                                  data[index].missingId),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return SizedBox();
                                            }
                                            final data =
                                                dbControler.myFoundReport;
                                            return data != null
                                                ? Column(
                                                    children: [
                                                      Text(
                                                        "Your pet found by a user ",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .buttonColor2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              // if(canLaunchUrl(url))
                                                              await launchUrl(
                                                                  Uri.parse(
                                                                      'tel:+91 ${data!.contactNumber}'));
                                                            },
                                                            child: Text(
                                                              "Call me",
                                                              style: TextStyle(
                                                                  color: CustomColors
                                                                      .buttonColor2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            )),
                                                      ),
                                                    ],
                                                  )
                                                : Text("");
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: data.length);
                      });
                }),
              )
              // isShown
              //     ? Container(
              //         color: Colors.greenAccent,
              //         width: 150,
              //         height: 150,
              //       )
              //     : const Text("Nothing to show"),
              // const SizedBox(
              //   height: 20,
              // ),
              // if(isShown)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: CustomColors.buttonColor1,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          CupertinoIcons.back,
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
