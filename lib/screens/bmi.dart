import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/calculate_bmi.dart';

// it will help to read the code  easily...
enum Gender {
  male,
  female,
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  Color maleCardColor = inActiveBoxColor;
//  Color femaleCardColor = inActiveBoxColor;
//
//  void updateColor(Gender gender){
//    if(gender == Gender.male){
//       if(maleCardColor == inActiveBoxColor){
//          maleCardColor = activeBoxColors;
//          femaleCardColor = inActiveBoxColor;
//       }else{
//         maleCardColor = inActiveBoxColor;
//       }
//    }else {
//      if (gender  == Gender.female) {
//        if (femaleCardColor == inActiveBoxColor) {
//          femaleCardColor = activeBoxColors;
//          maleCardColor = inActiveBoxColor;
//        } else {
//          femaleCardColor = inActiveBoxColor;
//        }
//       }
//    }
//  }
  Gender selectedGender;
  //height
  int numbers = 180;
  int counterWeight = 60;

  int ageCounter = 15;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
        Widget>[
      Expanded(
          child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              color: selectedGender == Gender.male
                  ? activeBoxColors
                  : inActiveBoxColor,
              childCard: IconContent(
                icon: FontAwesomeIcons.mars,
                label: 'Male',
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              color: selectedGender == Gender.female
                  ? activeBoxColors
                  : inActiveBoxColor,
              childCard: IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'Female',
              ),
            ),
          ),
        ],
      )),
      Expanded(
        child: ReusableCard(
          color: activeBoxColors,
          childCard: Column(
            children: <Widget>[
              Text("Height", style: textStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                // to specify whom to align...
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(numbers.toString(), style: numberStyle),
                  Text('cm', style: textStyle)
                ],
              ),
              SliderTheme(
                // .of() ->it will return the data from the closes theme
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                  thumbColor: Color(0xFFEB1555),
                  activeTrackColor: Colors.white,
                  overlayColor: Color(0x29EB1555),
                  inactiveTrackColor: Color(0xFF8D8E98),
                ),
                child: Slider(
                  value: numbers.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  // activeColor: Color(0xFFFFFFFF),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue) {
                    setState(() {
                      // round  is to convert it into integers
                      numbers = newValue.round();
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
      Expanded(
          child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              color: activeBoxColors,
              childCard: Column(
                children: <Widget>[
                  Text('WIEGHT', style: textStyle),
                  Text(counterWeight.toString(), style: numberStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            counterWeight--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            counterWeight++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeBoxColors,
              childCard: Column(
                children: <Widget>[
                  Text('Age', style: textStyle),
                  Text(ageCounter.toString(), style: numberStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            ageCounter--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            ageCounter++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),


      BottomButton(
        onPress: () {

          Calculate cal = new Calculate(height: numbers, weight: counterWeight);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultPage(
             bmiResult: cal.calculateBmi(),
            resultText: cal.getResult(),
            resultInterpretation: cal.getInterpretation(),
          )));
        },
        buttonTitle: "Calculate",
      ),
    ]);
  }
}
