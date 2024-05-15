import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomFloatButton extends StatelessWidget {
  const CustomFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {Navigator.pop(context);},
      child: Icon(
        CupertinoIcons.back,
        color: Colors.white,
        size: 60,
      ),
      backgroundColor: CustomColors.buttonColor1,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
  }
}
