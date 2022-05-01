import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  lightTheme() {
    return ThemeData(
      cardColor: const Color.fromARGB(255, 147, 144, 144),
      canvasColor:const Color.fromARGB(255, 255, 255, 255),
      
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 17, 0),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light)),
    );
  }

  darkTheme(){
    return ThemeData(
      cardColor:const Color(0xff403b58) ,
      canvasColor:const Color.fromARGB(255, 255, 255, 255),
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff403b58),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light)),
    );

  }
}
