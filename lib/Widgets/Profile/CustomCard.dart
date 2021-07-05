import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:ir_app/Models/stackholder.dart';

class ListViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}

class ProfileStackholderWidget extends StatefulWidget {
  ProfileStackholderWidget({Key key, this.stackholderItem}) : super(key: key);
  final StackholderItem stackholderItem;

  @override
  _ProfileStackholderWidgetState createState() =>
      _ProfileStackholderWidgetState();
}

class _ProfileStackholderWidgetState extends State<ProfileStackholderWidget> {
  StackholderItem stackholderItem;
  @override
  void initState() {
    super.initState();
    this.stackholderItem = widget.stackholderItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0),
      child: Row(children: [
        Expanded(
          child: Text(
            stackholderItem.name,
            style: TextStyle(
                fontSize: 14.0, fontWeight: FontWeight.w500, color: black_text),
          ),
        ),
        Container(
          width: 80.0,
          child: Text(
            stackholderItem.numOfShares,
            style: TextStyle(
                fontSize: 14.0, fontWeight: FontWeight.w500, color: black_text),
          ),
        ),
        SizedBox(width: 8),
        Container(
          width: 60.0,
          child: Text(
            stackholderItem.holding,
            style: TextStyle(
                fontSize: 14.0, fontWeight: FontWeight.w500, color: black_text),
          ),
        ),
        SizedBox(width: 16),
      ]),
    );
  }
}
