import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class AddIconButton extends StatelessWidget {
  AddIconButton({
    this.icon,
    @required this.onPressed,
    this.title,
    this.style,
    this.iconColor,
    this.fillColor
  });
  final IconData icon;
  final Function onPressed;
  final String title;
  TextStyle style = kLargeButtonTextStyle2;
  final iconColor;
  Color fillColor = kBottomContainerColor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Row(children: [Icon(icon, color: iconColor,),Text(title, style: style,)]),
      onPressed: onPressed,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 90,
        height: 50,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      fillColor: fillColor,
    );
  }
}
