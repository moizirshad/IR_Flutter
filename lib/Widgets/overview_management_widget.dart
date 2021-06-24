import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import 'package:ir_app/Models/news_item.dart';

class OverviewData extends StatefulWidget {
  OverviewData({Key key, this.newItem}) : super(key: key);
  final New newItem;

  @override
  _OverviewDataState createState() => _OverviewDataState();
}

class _OverviewDataState extends State<OverviewData> {
  New newItem;
  @override
  void initState() {
    super.initState();
    print("object");
    this.newItem = widget.newItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: lightGreyTextColor.withOpacity(0.3))),
        ),
        child: ListTile(
          leading: Text(this.newItem.textContent,
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          trailing: Text(this.newItem.source,
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
        ));
  }
}
