import 'package:flutter/material.dart';

class MajorShareHoldersWidget extends StatefulWidget {
  @override
  _MajorShareHoldersWidgetState createState() =>
      _MajorShareHoldersWidgetState();
}

class _MajorShareHoldersWidgetState extends State<MajorShareHoldersWidget> {
  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.amber[200]),
    );
  }
}
