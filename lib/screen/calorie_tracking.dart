import 'package:bmi_calculator/components/add_icon_button.dart';
import 'package:bmi_calculator/widgets/chart_provider.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/inactive/inactive_calorie_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator/components/calorie_data.dart';

class CalorieTracking extends StatelessWidget {
  int amountCalorie;
  DateTime date = DateTime.now();

  List<FlSpot> trackedCalories = [
    FlSpot(1, 3000),
    FlSpot(2, 2000),
    FlSpot(3, 3000),
    FlSpot(4, 2500),
    FlSpot(5, 3000),
    FlSpot(6, 2600),
    FlSpot(7, 2600),
  ];
  double calcAvg(List<FlSpot> dataList) {
    double avgVal = 0;
    for (FlSpot i in dataList) {
      avgVal += i.props[1];
    }
    ;
    return avgVal / 7;
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Tracking'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ReusableCard(
              colour: kContainerColor,
              cardChild: Padding(
                padding: const EdgeInsets.only(
                    right: 18.0, left: 12.0, top: 24, bottom: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Consumed Calories',
                      style: kTitleTextStyle2,
                    ),
                    SizedBox(
                      height: 10.0,
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
                    SizedBox(
                      height: 25.0,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color(0xFFEB1555),
                      onPressed: () {
                        DateTime date = DateTime.now();
                        Provider.of<CalorieData>(context, listen: false).addItem(
                            date.weekday.toDouble(), amountCalorie.toDouble());
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
            ReusableCard(
              colour: kContainerColor,
              cardChild: Column(
                children: [
                  CalorieTrackChart(),
                ],
                //trackedCalories,
              ),
            ),
            ReusableCard(
              colour: kContainerColor,
              cardChild: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Avg Calories this Week",
                      style: kTitleTextStyle2,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '${Provider.of<CalorieData>(context).getAvgCalories().toStringAsFixed(1)}',
                      textAlign: TextAlign.center,
                      style: kNumberTextStyle,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
