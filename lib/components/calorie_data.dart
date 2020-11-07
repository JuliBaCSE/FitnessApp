import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';

class CalorieData extends ChangeNotifier{
  List<FlSpot> _trackedCalories = [
    FlSpot(1, 3000),
    FlSpot(2, 2000),
    FlSpot(3, 3000),
    FlSpot(4, 2500),
    FlSpot(5, 3000),
    FlSpot(6, 2600),
    FlSpot(7, 2600),
  ];
  int get dataCount{
    return _trackedCalories.length;
  }
  void addItem(double day, double calorieAmount){
    _trackedCalories.add( FlSpot(day, calorieAmount));
    notifyListeners();
  }

  UnmodifiableListView <FlSpot> get trackedCalories{
    return UnmodifiableListView(_trackedCalories);
  }

  double getAvgCalories (){
    double avgCalories = 0;
    for(FlSpot tracked in _trackedCalories){
      avgCalories += tracked.props[1];
    }
    return avgCalories/(dataCount.toDouble());
  }

}