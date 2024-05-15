import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/const/custom_float_button.dart';
import 'package:stray_care/view/modules/user/adopt_details.dart';

class UserAdopt extends StatelessWidget {
  const UserAdopt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(),
                icon: Icon(CupertinoIcons.search, color: CustomColors.buttonColor1,size: 30,)
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.3,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdoptDetails()));
                          },
                          child: Container(
                            color: CustomColors.buttonColor2,
                          ),
                        ),
                      );
                    })
            )
          ],
        ),
      ),
      floatingActionButton: CustomFloatButton(),
    );
  }
}
