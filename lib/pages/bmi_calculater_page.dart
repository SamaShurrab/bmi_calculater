import 'package:flutter/material.dart';
import 'package:bmi_calculater/constant/strings.dart';

class BmiCalculaterPage extends StatefulWidget {
  const BmiCalculaterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BmiCalculaterPageState();
  }
}

class BmiCalculaterPageState extends State<BmiCalculaterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appBarTitle), centerTitle: true),
    );
  }
}
