import 'package:flutter/material.dart';
import 'package:fuel_prices/view/Pages/home_page.dart';
import 'package:fuel_prices/view/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      themeMode: ThemeMode.system,
      theme: appTheme.lightTheme(),
      darkTheme: appTheme.darkTheme(),
    );
  }
}
