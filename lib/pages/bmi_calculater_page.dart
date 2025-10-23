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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
                vertical: AppDimensions.padding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
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
                  SizedBox(width: AppDimensions.heightBetweenCards),
                  Expanded(
                    child: CustomCard(
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
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding),
              child: CustomCard(
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
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
                vertical: AppDimensions.padding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
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
                  SizedBox(width: AppDimensions.heightBetweenCards),
                  Expanded(
                    child: CustomCard(
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
