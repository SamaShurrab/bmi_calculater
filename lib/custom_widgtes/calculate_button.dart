import 'package:bmi_calculater/constant/colors.dart';
import 'package:bmi_calculater/constant/dimensions.dart';
import 'package:bmi_calculater/pages/bmi_result.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final String buttonText;
  const CalculateButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(AppDimensions.raduisButton),
                bottomLeft: Radius.circular(AppDimensions.raduisButton),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return BmiResult();
                },
              ),
            );
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
      ),
    );
  }
}
