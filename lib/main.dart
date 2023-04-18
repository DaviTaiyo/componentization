import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/mapping_colors.dart';

import 'View/Mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  get _defaultThemeData => ThemeData(
      primarySwatch: MaterialColor(0xFF0EFDF5, {
        50: Color.fromRGBO(14, 253, 237, 0.098),
        100: Color.fromRGBO(14, 253, 237, 0.2),
        200: Color.fromRGBO(14, 253, 233, 0.298),
        300: Color.fromRGBO(14, 253, 193, 0.4),
        400: Color.fromRGBO(14, 253, 221, 0.498),
        500: Color.fromRGBO(14, 253, 205, 0.6),
        600: Color.fromRGBO(14, 216, 196, 0.698),
        700: Color.fromRGBO(14, 216, 199, 0.8),
        800: Color.fromRGBO(14, 253, 201, 0.898),
        900: Color.fromRGBO(14, 253, 213, 1),
      }),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(ColorsConstants.smokers)),
      appBarTheme: AppBarTheme(
        color: Color(ColorsConstants.black),
        titleTextStyle: TextStyle(
            fontSize: 17, color: Colors.white, fontWeight: FontWeight.w700),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      scaffoldBackgroundColor: Color(ColorsConstants.light));
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Smokers Tabacaria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MainPage(),
    );
  }
}
