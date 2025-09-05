import 'package:bmi_calculater/constant/strings.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appBarTitle),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
