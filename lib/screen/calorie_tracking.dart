import 'package:bmi_calculator/components/Bottom_button.dart';
import 'package:bmi_calculator/components/add_icon_button.dart';
import 'package:bmi_calculator/screen/addCalories.dart';
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
  @override
  Widget build(BuildContext context) {
    Function showAddCalorie (){
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddCalories())));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Tracking'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBottomContainerColor,
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: showAddCalorie,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

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
            ),
          ],
        ),
      ),
    );
  }
}
// ReusableCard(
// colour: kContainerColor,
// cardChild: Padding(
// padding: const EdgeInsets.only(
// right: 18.0, left: 12.0, top: 24, bottom: 12),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text(
// 'Consumed Calories',
// style: kTitleTextStyle2,
// ),
// SizedBox(
// height: 10.0,
// ),
// TextField(
// onChanged: (value) {
// amountCalorie = int.parse(value);
// },
// textAlign: TextAlign.center,
// decoration: InputDecoration(),
// style: TextStyle(
// fontSize: 30,
// ),
// keyboardType: TextInputType.number,
// inputFormatters: <TextInputFormatter>[
// FilteringTextInputFormatter.digitsOnly
// ],
// ),
// SizedBox(
// height: 25.0,
// ),
// FlatButton(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(30)),
// color: Color(0xFFEB1555),
// onPressed: () {
// DateTime date = DateTime.now();
// Provider.of<CalorieData>(context, listen: false)
//     .addItem(date.weekday.toDouble(),
// amountCalorie.toDouble());
// },
// child: Text(
// 'Add',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// color: Colors.white),
// ),
// ),
// SizedBox(
// height: 15.0,
// ),
// ],
// ),
// ),
// ),