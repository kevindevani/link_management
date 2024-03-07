import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData appDarkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.black,
  primaryColor: AppColors.white,
  fontFamily: 'Roboto',
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.white,
  ),
);

ThemeData appLightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.white,
  fontFamily: 'Roboto',
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.black,
  ),
  // primaryTextTheme:const TextTheme(
  //   headlineLarge:  TextStyle(
  //     fontSize: 20.0,
  //     color: BaseColor.white,
  //     fontWeight: FontWeight.w600,
  //     fontFamily: 'Roboto',
  //   ),
  //   headline1: TextStyle(
  //     fontSize: 18.0,
  //     color: BaseColor.white,
  //     fontWeight: FontWeight.w600,
  //     fontFamily: 'Roboto',
  //   ),
  //   headline2: TextStyle(
  //     fontSize: 15.0,
  //     color: BaseColor.white,
  //     fontWeight: FontWeight.w600,
  //     fontFamily: 'Roboto',
  //   ),
  //   headline3: TextStyle(
  //     fontSize: 13.0,
  //     color: BaseColor.white,
  //     fontFamily: 'Roboto',
  //   ),
  //   headline4: TextStyle(
  //     fontSize: 10.0,
  //     color: BaseColor.white,
  //     fontFamily: 'Roboto',
  //   ),
  // ),
);
