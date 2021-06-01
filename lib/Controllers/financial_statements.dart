import 'package:flutter/material.dart';

class FinancialStatementsWidget extends StatefulWidget {
  @override
  _FinancialStatementsWidgetState createState() =>
      _FinancialStatementsWidgetState();
}

class _FinancialStatementsWidgetState extends State<FinancialStatementsWidget> {
  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green[200]),
    );
  }
}
