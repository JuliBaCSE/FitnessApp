import 'dart:math';


class CalculatorBrain {
  CalculatorBrain({this.weight, this.height, this.gender, this.age});
  final int height;
  final int weight;
  final String gender;
  final int age;

  double _bmr;

  String calculateBMR(){
    if(gender == 'male'){
      _bmr = 66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
    }else if (gender == 'female'){
      _bmr = 655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
    }
    else if (gender == null){
      return "missing entries";
    }
    return _bmr.toStringAsFixed(1);
  }

  // String getResults(){
  //   if(_bmr >= 25){
  //     return 'Overweight';
  //   }
  //   else if(_bmr > 18.5){
  //     return 'Normal';
  //   }
  //   else{
  //     return 'Underweight';
  //   }
  // }

  // String getInterpretation(){
  //   if(_bmr >= 25){
  //     return 'make more sport';
  //   }
  //   else if(_bmr > 18.5){
  //     return 'keep going';
  //   }
  //   else{
  //     return 'maybe eat more dude';
  //   }
  // }
  }
