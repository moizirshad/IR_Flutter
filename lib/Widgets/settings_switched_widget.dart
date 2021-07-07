import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SwitchedWidget extends StatefulWidget {
  // SwitchedWidget({Key key}) : super(key: key);

  SwitchedWidget({
    Key? key,
    this.textTitle = "",
    this.isSwitched = false,
  }) : super(key: key);

  bool isSwitched;
  String textTitle;

  @override
  _SwitchedWidgetState createState() => _SwitchedWidgetState();
}

class _SwitchedWidgetState extends State<SwitchedWidget> {
  bool isBreakingNewsSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Container(
          height: 40.0,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.textTitle,
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
              //CupertinoSwitch
              CupertinoSwitch(
                value: widget.isSwitched,
                activeColor: Colors.teal[900],
                onChanged: (bool value) {
                  setState(() {
                    widget.isSwitched = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
