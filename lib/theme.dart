import 'package:flutter/material.dart';

const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

const Color primaryColor = Color(0xff247881);
const Color primaryVariant1 = Color(0xffBDD7D9);
const Color primaryVariant2 = Color(0xff21BDC6);
const Color neutral100 = Colors.white;
const Color neutral900 = Color(0xff0C0D0E);

final themeData = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
        primary: primaryColor,
        primaryContainer: primaryVariant1,
        secondary: primaryVariant2,
        background: neutral100,
        onPrimaryContainer: neutral900),
    textTheme: const TextTheme(
      headlineLarge:
          TextStyle(fontFamily: 'Inter', fontWeight: bold, color: primaryColor),
      bodyLarge: TextStyle(
          fontFamily: 'Inter', fontWeight: semiBold, color: neutral100),
      bodyMedium: TextStyle(
          fontFamily: 'Inter', fontWeight: regular, color: neutral900),
      labelLarge: TextStyle(
          fontFamily: 'Inter', fontWeight: medium, color: primaryColor),
      labelMedium: TextStyle(
          fontFamily: 'Inter', fontWeight: regular, color: primaryColor),
    ));
