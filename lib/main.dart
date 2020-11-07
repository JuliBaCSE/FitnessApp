import 'package:bmi_calculator/components/calorie_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/input_page.dart';
import 'screen/calorie_tracking.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalorieData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        home: CalorieTracking(),
      ),

    );
  }
}

