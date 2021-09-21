import 'package:flutter/material.dart';
import 'package:bmi_calculator/const.dart';

class ReusableBottomButton extends StatelessWidget {
  ReusableBottomButton({this.onTap, this.bottomText});

  final Function onTap;
  final String bottomText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            bottomText,
            style: largeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottBarColour,
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kContHigh,
      ),
    );
  }
}
