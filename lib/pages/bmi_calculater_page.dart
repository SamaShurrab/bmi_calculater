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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appBarTitle)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: AppDimensions.padding,
              left: AppDimensions.padding,
              top: AppDimensions.heightBetweenCards,
            ),
            child: Row(
              children: [
                CustomCard(
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
                CustomCard(
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
              ],
            ),
          ),
          SizedBox(height: AppDimensions.heightBetweenCards),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding),
            child: CustomCard(
              height: 189,
              isSelected: false,
              child: HeightCard(),
            ),
          ),
          SizedBox(height: AppDimensions.heightBetweenCards),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding),
            child: Row(
              children: [
                CustomCard(
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
                CustomCard(
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
              ],
            ),
          ),
          SizedBox(height: AppDimensions.heightBetweenCards),
          CalculateButton(buttonText: AppStrings.calculate),
        ],
      ),
    );
  }
}
