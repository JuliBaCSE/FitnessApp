import 'package:bmi_calculator/components/add_icon_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/calorie_card.dart';

class CalorieTracking extends StatefulWidget {
  @override
  _CalorieTrackingState createState() => _CalorieTrackingState();
}

class _CalorieTrackingState extends State<CalorieTracking> {
  int amountCalorie;
  List<CalorieCard> trackedCalories = [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Tracking'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableCard(
              colour: kContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Consumed Calories',
                    style: kTitleTextStyle2,
                  ),
                  TextField(
                    onChanged: (value) {
                      amountCalorie = int.parse(value);
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(),
                    style: TextStyle(
                      fontSize: 30,
                    ),      
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  AddIconButton(icon: Icons.add, onPressed: (){
                    setState(() {
                      //ToDo: https://google.github.io/charts/flutter/example/time_series_charts/simple
                      DateTime date = DateTime.now();
                      trackedCalories.add(CalorieCard(
                        caloriesAmount: amountCalorie,
                        date: date,
                      ),);
                    });
                  },),

                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: trackedCalories,
            ),
          ),
        ],
      ),
    );
  }
}
