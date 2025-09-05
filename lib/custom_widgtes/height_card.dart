import 'package:bmi_calculater/constant/colors.dart';
import 'package:bmi_calculater/constant/dimensions.dart';
import 'package:bmi_calculater/constant/strings.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatefulWidget {
  const HeightCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return HeightCardState();
  }
}

class HeightCardState extends State<HeightCard> {
  int heightResult = 150;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.height,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: AppDimensions.heightBetweenItems),
        RichText(
          text: TextSpan(
            text: heightResult.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: AppStrings.cm,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ),
        SizedBox(height: AppDimensions.heightBetweenItems),

        SliderTheme(
          data: SliderThemeData(inactiveTrackColor: Colors.white),
          child: Slider(
            activeColor: AppColors.buttonColor,
            min: 0,
            max: 240,
            value: heightResult.toDouble(),
            onChanged: (newValue) {
              setState(() {
                heightResult = newValue.toInt();
              });
            },
          ),
        ),
      ],
    );
  }
}
