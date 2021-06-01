import 'package:flutter/material.dart';

class FinancialReportsWidget extends StatefulWidget {
  @override
  _FinancialReportsWidgetState createState() => _FinancialReportsWidgetState();
}

class _FinancialReportsWidgetState extends State<FinancialReportsWidget> {
  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red[300]),
    );
  }
}
