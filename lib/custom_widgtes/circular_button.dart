import 'package:bmi_calculater/constant/colors.dart';
import 'package:bmi_calculater/constant/dimensions.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData iconName;
  final void Function()? onTap;
  const CircularButton({super.key, required this.iconName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey,
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        height: AppDimensions.heightWidthCircularButton,
        width: AppDimensions.heightWidthCircularButton,
        child: Card(
          color: AppColors.textColor,
          elevation: 0,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(iconName),
        ),
      ),
    );
  }
}
