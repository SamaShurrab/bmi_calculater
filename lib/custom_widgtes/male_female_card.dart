import 'package:bmi_calculater/constant/colors.dart';
import 'package:flutter/material.dart';

class MaleFemaleCard extends StatelessWidget {
  final IconData? iconName;
  final String? textData;
  final bool isSelected;
  const MaleFemaleCard({
    super.key,
    this.iconName,
    this.textData,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = isSelected ? Colors.white : AppColors.textColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(iconName, color: Colors.white, size: 80),
        Text(
          textData!,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
