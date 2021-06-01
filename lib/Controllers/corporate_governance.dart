import 'package:flutter/material.dart';

class CorporateGovernanceWidget extends StatefulWidget {
  @override
  _CorporateGovernanceWidgetState createState() =>
      _CorporateGovernanceWidgetState();
}

class _CorporateGovernanceWidgetState extends State<CorporateGovernanceWidget> {
  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[200]),
    );
  }
}
