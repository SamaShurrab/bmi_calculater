import 'package:bmi_calculater/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double height;
  final bool isSelected;
  const CustomCard({
    super.key,
    required this.child,
    this.onTap,
    required this.height,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isSelected
        ? AppColors.buttonColor
        : AppColors.secondaryColor;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: SizedBox(
        height: height,
        child: Card(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),
      ),
    );
  }
}
