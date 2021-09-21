import 'package:flutter/material.dart';
import 'package:bmi_calculator/const.dart';

class IconCont extends StatelessWidget {
  final IconData genderIcon;
  final String genderText;
  IconCont(this.genderIcon, this.genderText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
