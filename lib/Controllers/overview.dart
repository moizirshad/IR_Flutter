import 'package:flutter/material.dart';
import 'package:ir_app/Statistics/statistics_widget.dart';

class OverViewWidget extends StatefulWidget {
  @override
  _OverViewWidgetState createState() => _OverViewWidgetState();
}

class _OverViewWidgetState extends State<OverViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StatisticsWidget(),
            ],
          )),
    );
  }
}
