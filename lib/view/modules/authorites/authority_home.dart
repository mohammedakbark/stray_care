import 'package:flutter/material.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          itemCount: 6,
            itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
                  height: 200,
                  child: Center(
                    child: Text("Incident Photo"),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Description", style: TextStyle(color: CustomColors.buttonColor1, fontWeight: FontWeight.bold),)
              ],
            ),
          );
        })
      ),
      floatingActionButton: CustomFloatButton(),
    );
  }
}
