import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';

class CalorieData extends ChangeNotifier{
  List<FlSpot> _trackedCaloriesWeek = [
  ];
  List<FlSpot> _trackedCaloriesMonth = [
  ];
  int get dataCountWeek{
    return _trackedCaloriesWeek.length;
  }
  int get dataCountMonth{
    return _trackedCaloriesMonth.length;
  }
  void addItem(double day, double calorieAmount){
    bool dayAlreadyIncluded = false;
    for(int i = 0; i<dataCountWeek ; i++){
      FlSpot tracked = _trackedCaloriesWeek[i];
      if(tracked.props[0] == day){
        double calc = tracked.props[1];
        _trackedCaloriesWeek.removeAt(i);
        calc += calorieAmount;
        _trackedCaloriesWeek.insert(i, FlSpot(day, calc));
        dayAlreadyIncluded = true;
      }
    }
    if(!dayAlreadyIncluded) {
      _trackedCaloriesWeek.add(FlSpot(day, calorieAmount));
      if (_trackedCaloriesWeek.length % 7 == 0) {
        int count = 0;
        int week = 1;
        double avgCaloriesWeek = 0;
        double avgCaloriesMonth = 0;
        for (FlSpot tracked in _trackedCaloriesWeek) {
          avgCaloriesWeek += tracked.props[1];
          count++;
          if (count == 7) {
            count = 0;
            avgCaloriesMonth = avgCaloriesWeek / 7;
            _trackedCaloriesMonth.add(
                FlSpot(week.toDouble(), avgCaloriesMonth));
            week++;
            avgCaloriesWeek = 0;
          }
        }
      }
    }
    print(dataCountWeek);
    notifyListeners();
  }

  UnmodifiableListView <FlSpot> get trackedCaloriesWeek{
    return UnmodifiableListView(_trackedCaloriesWeek);
  }
  UnmodifiableListView <FlSpot> get trackedCaloriesMonth{
    return UnmodifiableListView(_trackedCaloriesMonth);
  }

  double getWeekAvgCalorie (){
    double avgCalories = 0;
    if(_trackedCaloriesWeek.length != 0) {
      for (FlSpot tracked in _trackedCaloriesWeek) {
        avgCalories += tracked.props[1];
      }
      return avgCalories/(dataCountWeek.toDouble());
    }
    return avgCalories;
  }

  double getMonthAvgCalorie (){
    double avgCalories = 0;
    if(_trackedCaloriesMonth.length != 0) {
      for (FlSpot tracked in _trackedCaloriesMonth) {
        avgCalories += tracked.props[1];
      }
      return avgCalories/(dataCountMonth.toDouble());
    }
    return avgCalories;
  }

}