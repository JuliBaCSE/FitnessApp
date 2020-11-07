import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator/components/calorie_data.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/components/add_icon_button.dart';

class AddCalories extends StatefulWidget {
  // AddTaskScreen({this.addTaskCallback});
  // final Function addTaskCallback;
  @override
  _AddCaloriesState createState() => _AddCaloriesState();
}

class _AddCaloriesState extends State<AddCalories> {
  bool addPast = false;

  @override
  Widget build(BuildContext context) {
    double amountCalorie;
    double day;
    double month;
    return Container(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Positioned(child: FlatButton(onPressed: null, child: Text("past"), ), top: 0.0, right: 0.0,),
          Align(
              alignment: Alignment.topRight,
              child: AddIconButton(
                onPressed: () {
                  setState(() {
                    addPast = !addPast;
                  });
                },
                icon: Icons.add,
                iconColor: kBottomContainerColor,
                title: !addPast?  "Past":"Today",
                style: kLabelTextStyle,
                fillColor: kContainerColor,
              )),
          Text( !addPast ? "Add Calories" : "Add past Calories",
              textAlign: TextAlign.center, style: kTitleTextStyle2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: !addPast
                ? TextField(
                    autofocus: true,
                    onChanged: (value) {
                      amountCalorie = double.parse(value);
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
                  )
                : Row(
                    children: [
                      InputField(autoFous: true,getValue:(value) {
                        amountCalorie = double.parse(value);
                        print(amountCalorie);
                      },hintText: "calories" ,),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            InputField(autoFous:false,hintText: "day",getValue: (value) {
                              day = double.parse(value);
                              print(day);
                            },),
                            SizedBox(
                              width: 5,
                            ),
                            InputField(autoFous:false,hintText: "month",getValue: (value) {
                              month = double.parse(value);
                              print(month);
                            },),

                          ],
                        ),
                      )
                    ],
                  ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: FlatButton(
              onPressed: addPast ? () {

                Provider.of<CalorieData>(context, listen: false)
                    .addItem(day, amountCalorie);
                Navigator.pop(context);
                // addTaskCallback(newTask1234Title);
              } : () {
                DateTime date = DateTime.now();
                Provider.of<CalorieData>(context, listen: false)
                    .addItem(date.weekday.toDouble(), amountCalorie);
                Navigator.pop(context);
                // addTaskCallback(newTask1234Title);
              },
              child: Center(
                  child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              )),
              color: kBottomContainerColor,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: kContainerColor,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  InputField({this.getValue, this.hintText, this.autoFous});
  final Function getValue;
  final String hintText;
  final bool autoFous;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        autofocus: autoFous,
        onChanged: getValue,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: hintText, hintStyle: TextStyle(fontSize: 15)),
        style: TextStyle(
          fontSize: 30,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}



// Expanded(
// child: TextField(
// autofocus: false,
// onChanged: (value) {
// amountCalorie = double.parse(value);
// },
// textAlign: TextAlign.center,
// decoration: InputDecoration(
// hintText: "month",
// hintStyle: TextStyle(fontSize: 15)),
// style: TextStyle(
// fontSize: 30,
// ),
// keyboardType: TextInputType.number,
// inputFormatters: <TextInputFormatter>[
// FilteringTextInputFormatter.digitsOnly
// ],
// ),
// )