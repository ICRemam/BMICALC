import 'package:flutter/material.dart';

class ReusableCont extends StatelessWidget {
  ReusableCont(this.color, {this.cardChild, this.onPressed});

  final Color color;
  final Widget cardChild;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: 170,
        height: 195,
      ),
    );
  }
}
