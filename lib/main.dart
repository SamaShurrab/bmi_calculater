import 'package:flutter/material.dart';
import 'package:bmi_calculater/pages/bmi_calculater_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: BmiCalculaterPage(),
      
    ),
  );
}
