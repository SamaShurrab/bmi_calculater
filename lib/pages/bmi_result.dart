import 'package:bmi_calculater/constant/colors.dart';
import 'package:bmi_calculater/constant/dimensions.dart';
import 'package:bmi_calculater/constant/strings.dart';
import 'package:bmi_calculater/custom_widgtes/calculate_button.dart';
import 'package:bmi_calculater/custom_widgtes/custom_card.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final double result;
  const BmiResult({super.key, required this.result});
  String bmiCategories(double result) {
    if (result < 18.5) {
      return AppStrings.underweight;
    }
    if (result >= 18.5 && result < 24.9) {
      return AppStrings.normal;
    }
    if (result >= 25 && result < 29.9) {
      return AppStrings.overweight;
    }
    return AppStrings.obesity;
  }

  Color bmiCategoriesColor(String bmiCategorie) {
    if (bmiCategorie == AppStrings.underweight) {
      return Colors.yellow;
    }
    if (bmiCategorie == AppStrings.normal) {
      return Colors.green;
    }
    if (bmiCategorie == AppStrings.overweight) {
      return Colors.orange;
    }
    return Colors.red;
  }

  String bmiCategoriesAdvise(String bmiCategorie) {
    if (bmiCategorie == AppStrings.underweight) {
      return AppStrings.underweightAdvise;
    }
    if (bmiCategorie == AppStrings.normal) return AppStrings.normalAdvise;
    if (bmiCategorie == AppStrings.overweight) {
      return AppStrings.overweightAdvise;
    }
    return AppStrings.obesityAdvise;
  }

  @override
  Widget build(BuildContext context) {
    String bmiCategorie = bmiCategories(result);
    Color bmiCategorieColor = bmiCategoriesColor(bmiCategorie);
    String bmiCategorieAdvise = bmiCategoriesAdvise(bmiCategorie);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appBarTitle),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.padding),
              child: Text(
                AppStrings.yourResult,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.padding,
                right: AppDimensions.padding,
                bottom: 35,
              ),
              child: CustomCard(
                isSelected: false,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Center(
                      child: Text(
                        bmiCategorie,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: bmiCategorieColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        bmiCategorieAdvise,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CalculateButton(
            buttonText: AppStrings.reCalculate,
            pageName: "bmiCalculate",
          ),
        ],
      ),
    );
  }
}
