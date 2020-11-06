import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class AddIconButton extends StatelessWidget {
  AddIconButton({
    @required this.icon,
    @required this.onPressed,
    this.title
  });
  final IconData icon;
  final Function onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Row(children: [Icon(icon),Text(title, style: kLargeButtonTextStyle2,)]),
      onPressed: onPressed,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 90,
        height: 50,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      fillColor: kBottomContainerColor,
    );
  }
}
