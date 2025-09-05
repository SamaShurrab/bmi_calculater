import 'package:bmi_calculater/constant/colors.dart';
import 'package:bmi_calculater/constant/dimensions.dart';
import 'package:bmi_calculater/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculater/pages/bmi_calculater_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: AppStrings.appBarTitle,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimensions.raduisButton),
              topRight: Radius.circular(AppDimensions.raduisButton),
            ),
          ),
          elevation: 3,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: "Inter"),
        scaffoldBackgroundColor: AppColors.primaryColor,
      ),
      themeMode: ThemeMode.dark,
      home: const BmiCalculaterPage(),
    ),
  );
}
