import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color grayColor = const Color(0xff696F79);
  static Color mediumgrayColor = const Color(0xffC3C5C8);
  static Color lightgrayColor = const Color.fromARGB(255, 194, 196, 198);
  static Color primaryColor = const Color(0xff1DBF73);
  static Color blackColor = const Color(0xff000000);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color lightGrayColor = const Color(0xffD9D9D9);
  static ThemeData lightMode = ThemeData(
    // useMaterial3: false,
    primaryColor: primaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        color: grayColor,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: whiteColor,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 12,
        color: grayColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 18,
        color: blackColor,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 14,
        color: grayColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 1,
        selectedItemColor: primaryColor,
        unselectedItemColor: mediumgrayColor,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          color: primaryColor,
        ),
        unselectedLabelStyle: TextStyle(
            color: mediumgrayColor, fontSize: 12, fontWeight: FontWeight.w400)),
  );
}
