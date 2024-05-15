import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/view/const/custom_colors.dart';

class UserMyReports extends StatefulWidget {
  const UserMyReports({super.key});

  @override
  State<UserMyReports> createState() => _UserMyReportsState();
}


class _UserMyReportsState extends State<UserMyReports> {

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
                    hintStyle: const TextStyle(color: CustomColors.buttonColor1),
                    suffixIcon: const Icon(
                      CupertinoIcons.search,
                      color: CustomColors.buttonColor1,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 80,
              ),
              isShown
                  ? Container(
                      color: Colors.greenAccent,
                      width: 150,
                      height: 150,
                    )
                  : const Text("Nothing to show"),
              const SizedBox(
                height: 20,
              ),
              if(isShown)
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50)),
                child: TextButton(
                    onPressed: onPress,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Found",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
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
