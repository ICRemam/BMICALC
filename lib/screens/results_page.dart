import 'package:bmi_calculator/const.dart';
import 'package:flutter/material.dart';
import '../components/reusable_cont.dart';
import 'package:bmi_calculator/components/reusable_butbut.dart';

class Resultspage extends StatelessWidget {
  Resultspage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.inter});

  final String bmiResult;
  final String resultText;
  final String inter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your results',
                style: largeButtonTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCont(
              kActiveColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    inter,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ReusableBottomButton(
            bottomText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )),
        ],
      ),
    );
  }
}
