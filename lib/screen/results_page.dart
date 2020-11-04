import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Bottom_button.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmrResults});

  final String bmrResults;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMR Calculator'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            )),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your BMR is",
                      style: kResultTextStyle,
                    ),
                    Text(bmrResults, style: kBMITextStyle,),
                    Text("this is an estimated amount of calories you burn without any exercise".toUpperCase(), textAlign: TextAlign.center, style: kBodyTextStyle, ),
                    Text("the exact amount can vary from person to person".toUpperCase(), textAlign: TextAlign.center, style: kBodyTextStyle, )
                  ],
                ),
              ),
            ),
            BottomButton( ButtonTitle: 'RE-CALCULATE', onTap: () {
              Navigator.pop(
                context,
              );
            },),
          ]),
    );
  }
}
