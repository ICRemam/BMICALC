import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../components/reusable_cont.dart';
import '../const.dart';
import '../components/round_icon_b.dart';
import 'package:bmi_calculator/components/reusable_butbut.dart';
import 'results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(
              child: ReusableCont(
                selectedGender == Gender.male ? kActiveColour : kInactiveColour,
                cardChild: IconCont(FontAwesomeIcons.mars, 'MALE'),
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              ),
            ),
            Expanded(
              child: ReusableCont(
                selectedGender == Gender.female
                    ? kActiveColour
                    : kInactiveColour,
                cardChild: IconCont(FontAwesomeIcons.venus, 'FEMALE'),
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
              ),
            ),
          ]),
          Row(
            children: [
              Expanded(
                child: ReusableCont(
                  kActiveColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumsInIcons,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: kBottBarColour,
                          overlayColor: Color(0x1fEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 240.0,
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(children: [
            Expanded(
              child: ReusableCont(
                kActiveColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumsInIcons,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          onTap: () {
                            setState(() {
                              weight--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          onTap: () {
                            setState(() {
                              weight++;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            //left cont ending

            Expanded(
              child: ReusableCont(
                kActiveColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumsInIcons,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          onTap: () {
                            setState(() {
                              age--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          onTap: () {
                            setState(() {
                              age++;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
          ReusableBottomButton(
            bottomText: 'Calculate',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultspage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    inter: calc.getInter(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
