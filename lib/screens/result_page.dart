import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_cards.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/bmi.dart';


class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,this.resultText,this.resultInterpretation});

  final String bmiResult;
 final String resultText;
 final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0A21),
          scaffoldBackgroundColor: Color(0xFF0A0A21)),
      home: Scaffold(
          body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Expanded(
            child:Container(
              margin:EdgeInsets.all(16.0),
              child: Text(
              "YOur  Result",
              style: resultTextStyle,
               ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeBoxColors,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(resultText, style: resultTitleText),
                  Text(bmiResult, style: resultBMIText,),
                  Text(resultInterpretation,
                      textAlign:TextAlign.center,
                      style: resultTitleText2),

                ],

              ),
            ),
          ),
              Expanded(
                child:BottomButton(onPress: () {
                  Navigator.pop(context);
                },
                  buttonTitle: "Re-Calculate",)
              ),
        ],
      )),
    );
  }
}
