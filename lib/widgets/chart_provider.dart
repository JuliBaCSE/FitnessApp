import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/calorie_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bmi_calculator/components/linechart_design.dart';
import 'package:bmi_calculator/constants.dart';

class CalorieTrackChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<CalorieData>(
      builder: (context, calorieData, index) {
        return AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: Chart(
              gradientColors: kGradientColors,
              data: calorieData.trackedCalories,
            ),
          ),
        );
      },
    );
  }
}


