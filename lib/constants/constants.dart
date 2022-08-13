import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:to_do_app/MyWidgets/registerUserStep1.dart';
import 'package:to_do_app/mainScreen.dart';

import '../main.dart';

class sabitler {
  static List<Step> LoginSteps = [
    Step(
      title: Text("User info"),
      content: Column(
        children: [
          UserBilgi(
            onReturnData: (value) {},
          ),
        ],
      ),
    ),
  ];
  static AppBar baslik(String baslikYazisi) => AppBar(
        elevation: 3,
        title: Center(
          child: Text(
            baslikYazisi,
            style: sabitler.textStyle(25, FontWeight.bold, sabitler.mainColor),
          ),
        ),
        backgroundColor: Colors.white,
      );

  static Color mainColor = Colors.purple;
  static Color fillColor = sabitler.mainColor.withOpacity(0.3);

  static TextStyle textStyle(
      double size, FontWeight fontWeight, Color colorname) {
    return GoogleFonts.quicksand(
        fontWeight: fontWeight, color: colorname, fontSize: size);
  }

  static TextStyle titleStyle(
      double size, FontWeight fontWeight, Color colorname) {
    return GoogleFonts.roboto(
        fontWeight: fontWeight, color: colorname, fontSize: size);
  }

  static TextStyle contentStyle(
      double size, FontWeight fontWeight, Color colorname) {
    return GoogleFonts.roboto(
        fontWeight: fontWeight, color: colorname, fontSize: size);
  }

  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(sabitler.mainColor),
  );
  static BoxDecoration boxDec = BoxDecoration(
    borderRadius: BorderRadius.circular(25),
  );
  static BoxDecoration boxDecNot = BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.purple.withOpacity(0.3),
    border: Border.all(width: 1),
  );
}
