import 'package:bmi_calculater/constant/colors.dart';
import 'package:bmi_calculater/custom_widgtes/circular_button.dart';
import 'package:flutter/material.dart';

class WeightAgeCard extends StatefulWidget {
  final String textData;
  final ValueChanged onChanged;
  final int value;
  const WeightAgeCard({
    super.key,
    required this.textData,
    required this.onChanged,
    required this.value,
  });

  @override
  State<StatefulWidget> createState() {
    return WeightAgeCardState();
  }
}

class WeightAgeCardState extends State<WeightAgeCard> {
  void incremnetValue() {
    setState(() {
      widget.onChanged(widget.value + 1);
    });
  }

  void decrementValue() {
    setState(() {
      if (widget.value > 0) widget.onChanged(widget.value - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.textData,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: AppColors.textColor,
          ),
        ),
        Text(
          widget.value.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularButton(iconName: Icons.add, onTap: incremnetValue),
            CircularButton(iconName: Icons.remove, onTap: decrementValue),
          ],
        ),
      ],
    );
  }
}
