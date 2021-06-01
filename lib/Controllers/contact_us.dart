import 'package:flutter/material.dart';

class ContactUsWidget extends StatefulWidget {
  @override
  _ContactUsWidgetState createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
    );
  }
}
