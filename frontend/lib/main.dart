import 'package:flutter/material.dart';
import 'package:fuel_prices/view/Pages/home_page.dart';
import 'package:fuel_prices/view/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme=AppTheme();
    return  MaterialApp(
      home: const HomePage(),
      themeMode: ThemeMode.light,
      theme:appTheme.lightTheme() ,
      darkTheme: appTheme.darkTheme(),
    );
  }
}
