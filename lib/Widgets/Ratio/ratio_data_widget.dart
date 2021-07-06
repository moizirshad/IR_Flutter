import 'package:flutter/material.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:ir_app/Models/news_item.dart';

class RatioDataWidget extends StatefulWidget {
  RatioDataWidget({Key key, this.newItem}) : super(key: key);
  final New newItem;

  @override
  _RatioDataWidgetState createState() => _RatioDataWidgetState();
}

class _RatioDataWidgetState extends State<RatioDataWidget> {
  @override
  New newItem;
  @override
  void initState() {
    super.initState();
    this.newItem = widget.newItem;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(this.newItem.textContent,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(this.newItem.source,
                    style: TextStyle(color: Colors.black, fontSize: 16.0)),
              )
            ],
          )),
        ],
      ),
    );
  }
}
