import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class CalorieCard extends StatelessWidget {
  CalorieCard({this.caloriesAmount, this.date});
  final int caloriesAmount;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${caloriesAmount.toString()} calc" , style: kCalcTrackTextStyle,),
          Spacer(flex: 2,),
          Text('${date.day}.${date.month} at ${date.hour} : ${date.minute}', style: kCalcTrackTextStyle,),
        ],
      ),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

