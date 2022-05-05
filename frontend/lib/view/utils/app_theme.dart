import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuel_prices/view/utils/colors.dart';

class AppTheme {
  lightTheme() {
    return ThemeData(
      cardColor: const Color.fromARGB(255, 147, 144, 144),
      canvasColor: const Color.fromARGB(255, 255, 255, 255),
      primaryColor: Colors.white,
      primaryColorLight: Colors.black,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 17, 0),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light)),
    );
  }

  darkTheme() {
    return ThemeData(
      cardColor: const Color(0xff403b58),
      canvasColor: const Color.fromARGB(255, 30, 27, 27),
      primaryColor: Colors.white,
      primaryColorDark: Colors.white,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff403b58),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light)),
    );
  }

  
}
