import 'package:bmi_calculater/constant/dimensions.dart';
import 'package:bmi_calculater/constant/strings.dart';
import 'package:bmi_calculater/custom_widgtes/calculate_button.dart';
import 'package:bmi_calculater/custom_widgtes/custom_card.dart';
import 'package:bmi_calculater/custom_widgtes/height_card.dart';
import 'package:bmi_calculater/custom_widgtes/male_female_card.dart';
import 'package:bmi_calculater/custom_widgtes/weight_age_card.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class BmiCalculaterPage extends StatefulWidget {
  const BmiCalculaterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BmiCalculaterPageState();
  }
}

class BmiCalculaterPageState extends State<BmiCalculaterPage> {
  Gender? selectedGender;
  int age = 26;
  int weight = 60;
  int height = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appBarTitle)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.padding,
              right: AppDimensions.padding,
              top: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    height: AppDimensions.height_Femal_Male_Weight_Age_Card,
                    isSelected: selectedGender == Gender.male,
                    onTap: () => setState(() {
                      selectedGender = Gender.male;
                    }),
                    child: MaleFemaleCard(
                      isSelected: selectedGender == Gender.male,
                      iconName: Icons.male,
                      textData: AppStrings.male,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    height: AppDimensions.height_Femal_Male_Weight_Age_Card,
                    isSelected: selectedGender == Gender.female,
                    onTap: () => setState(() {
                      selectedGender = Gender.female;
                    }),
                    child: MaleFemaleCard(
                      isSelected: selectedGender == Gender.female,
                      iconName: Icons.female,
                      textData: AppStrings.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding,
              vertical: AppDimensions.heightBetweenCards,
            ),
            child: CustomCard(
              height: 189,
              isSelected: false,
              child: HeightCard(
                height: height,
                onChanged: (newValue) {
                  setState(() {
                    height = newValue.toInt();
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.padding,
              right: AppDimensions.padding,
              bottom: AppDimensions.padding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    height: AppDimensions.height_Femal_Male_Weight_Age_Card,
                    isSelected: false,
                    child: WeightAgeCard(
                      textData: AppStrings.weight,
                      value: weight,
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    height: AppDimensions.height_Femal_Male_Weight_Age_Card,
                    isSelected: false,
                    child: WeightAgeCard(
                      textData: AppStrings.age,
                      value: age,
                      onChanged: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            buttonText: AppStrings.calculate,
            weight: weight,
            age: age,
            height: height,
            selectedGender: selectedGender,
            pageName: "result",
          ),
        ],
      ),
    );
  }
}
