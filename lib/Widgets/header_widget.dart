import 'package:flutter/material.dart';
import 'package:ir_app/Constants/colors.dart';

class HeaderWidget extends StatefulWidget {
  HeaderWidget({Key key, this.titleText}) : super(key: key);
  final String titleText;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16.0),
      color: Colors.grey[400].withOpacity(0.3),
      height: 80,
      child: Text(
        this.widget.titleText,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: black_text),
      ),
    );
  }
}
