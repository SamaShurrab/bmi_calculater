import 'package:bmi_calculater/constant/colors.dart';
import 'package:bmi_calculater/constant/dimensions.dart';
import 'package:bmi_calculater/pages/bmi_calculater_page.dart';
import 'package:bmi_calculater/pages/bmi_result.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final String buttonText;
  final int? age;
  final int? weight;
  final int? height;
  final String pageName;
  final Gender? selectedGender;
  const CalculateButton({
    super.key,
    required this.buttonText,
    this.age,
    this.height,
    this.weight,
    required this.pageName,
    this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(AppDimensions.raduisButton),
              bottomLeft: Radius.circular(AppDimensions.raduisButton),
            ),
          ),
        ),
        onPressed: () {
          if (pageName == "result") {
            if (selectedGender != null) {
              double heightInMeter = height! / 100;
              double result = weight! / (heightInMeter * heightInMeter);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return BmiResult(result: result);
                  },
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Must Choose Gender",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
