
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theday/app/resource/reponsive_utils.dart';

class TextConstant {
  static Text textH1(BuildContext context,
      {required String text,
      double size = 28,
      FontWeight fontWeight = FontWeight.w900,
      Color color = Colors.black}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: UtilsReponsive.formatFontSize(size, context),
          fontWeight: fontWeight,
          color: color),
    );
  }

 static Text textH2(BuildContext context,
      {required String text,
      double size = 22,
      FontWeight fontWeight = FontWeight.w800,
      Color color = Colors.black}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: UtilsReponsive.formatFontSize(size, context),
          fontWeight: fontWeight,
          color: color),
    );
  }

 static Text textH3(BuildContext context,
      {required String text,
      double size = 16,
      FontWeight fontWeight = FontWeight.w700,
      Color color = Colors.black}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: UtilsReponsive.formatFontSize(size, context),
          fontWeight: fontWeight,
          color: color),
    );
  }

 static Text subTile1(BuildContext context,
      {required String text,
      double size = 16,
      bool isCancel = false,
      FontWeight fontWeight = FontWeight.w600,
      Color color = Colors.black}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          decoration: isCancel? TextDecoration.lineThrough:null,
          fontSize: UtilsReponsive.formatFontSize(size, context),
          fontWeight: fontWeight,
          color: color),
    );
  }

 static Text subTile2(BuildContext context,
      {required String text,
      double size = 14,
      bool isCancel = false,
      FontWeight fontWeight = FontWeight.w600,
      Color color = Colors.black}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          decoration: isCancel? TextDecoration.lineThrough:null,
          fontSize: UtilsReponsive.formatFontSize(size, context),
          fontWeight: fontWeight,
          color: color),
    );
  }

 static Text subTile3(BuildContext context,
      {required String text,
      double size = 13,
      FontWeight fontWeight = FontWeight.w600,
      Color color = Colors.black}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: UtilsReponsive.formatFontSize(size, context),
          fontWeight: fontWeight,
          color: color),
    );
  }
}
