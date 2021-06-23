
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TextWidget extends StatelessWidget{

  TextWidget(this.title,this.isHeader);

  final String title;
  final bool isHeader;

  final double fontSize = 14.0;
  final Color color = Colors.black;

  final FontWeight fontWeight = FontWeight.bold;
  final TextDecoration decoration = TextDecoration.none;

  @override
  Widget build(BuildContext context) {

      return Text(title, style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight, decoration: decoration));
  }

}