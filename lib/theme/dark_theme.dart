import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Rubik',
  primaryColor: kPrimaryColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF2C2C2C),
  cardColor: const Color(0xFF252525),
  hintColor: const Color(0xFFE7F6F8),
  focusColor: const Color(0xFFADC4C8),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: Colors.white,
    textStyle: const TextStyle(color: Colors.white),
  )),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
  textTheme:  TextTheme(
    // button: const TextStyle(color: Color(0xFF252525)),
    titleLarge:  GoogleFonts.poppins(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge:  GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium:  GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    displayMedium:  GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: Colors.black,
    ),
    // headline1: const TextStyle(
    //     fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    // headline2: const TextStyle(
    //     fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    // headline3: const TextStyle(
    //     fontWeight: FontWeight.w500, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    // headline4: const TextStyle(
    //     fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    // headline5: const TextStyle(
    //     fontWeight: FontWeight.w700, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    // headline6: const TextStyle(
    //     fontWeight: FontWeight.w800, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    // caption: const TextStyle(
    //     fontWeight: FontWeight.w900, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    // subtitle1: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
    // bodyText2: const TextStyle(fontSize: 12.0),
    // bodyText1: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);
