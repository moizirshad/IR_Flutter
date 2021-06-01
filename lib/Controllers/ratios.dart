import 'package:flutter/material.dart';

class RatiosWidget extends StatefulWidget {
  @override
  _RatiosWidgetState createState() => _RatiosWidgetState();
}

class _RatiosWidgetState extends State<RatiosWidget> {
  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.yellow[200]),
    );
  }
}
