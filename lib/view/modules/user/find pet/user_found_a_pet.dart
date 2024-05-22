import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/modules/user/find%20pet/missing_oet_details.dart';

class FountAPetPage extends StatefulWidget {
  const FountAPetPage({super.key});

  @override
  State<FountAPetPage> createState() => _FountAPetPageState();
}

class _FountAPetPageState extends State<FountAPetPage> {
  bool isShown = true;

  void onPress() {
    setState(() {
      isShown = false;
    });
  }

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
              const Text(
                "Missing Animals",
                style: TextStyle(
                    color: CustomColors.buttonColor1,
                    fontSize: 33,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Consumer<UserDBController>(
                    builder: (context, dbControler, child) {
                  return FutureBuilder(
                      future: dbControler.getAllMissingReposts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final data = dbControler.listOfMissingReport;
                        return data.isEmpty
                            ? const Center(
                                child: Text("Report not found"),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MissingPetDetailPage(
                                                    reportMissingModel:
                                                        data[index],
                                                  )));
                                    },
                                    child: Column(
                                      children: [
                                        Image.network(data[index].imgUrl),

                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //       color: Colors.green,
                                        //       borderRadius:
                                        //           BorderRadius.circular(50)),
                                        //   child: TextButton(
                                        //       onPressed: onPress,
                                        //       child: const Padding(
                                        //         padding: EdgeInsets.symmetric(
                                        //             horizontal: 10.0),
                                        //         child: Text(
                                        //           "Found",
                                        //           style: TextStyle(
                                        //               color: Colors.white),
                                        //         ),
                                        //       )),
                                        // ),
                                      ],
                                    ),
                                  );
                                },
                                // separatorBuilder: (context, index) =>
                                //     const Divider(),
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
