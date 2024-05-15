import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToastMessage {
  static errorToast(context, message) {
    CherryToast.error(
        title: Text(
      message,
      style: GoogleFonts.poppins(
        fontSize: 16,
      ),
    )).show(context);
  }

  static warningToast(context, message) {
    CherryToast.warning(
        title: Text(
      message,
      style: GoogleFonts.poppins(
        fontSize: 16,
      ),
    )).show(context);
  }

  static successToast(context, message) {
    CherryToast.success(
        title: Text(
      message,
      style: GoogleFonts.poppins(
        fontSize: 16,
      ),
    )).show(context);
  }
}
