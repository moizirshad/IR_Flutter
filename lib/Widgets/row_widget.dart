import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import 'package:ir_app/Models/news_item.dart';

class RowWidget extends StatefulWidget {
  RowWidget({Key? key, required this.newItem}) : super(key: key);
  final New newItem;

  @override
  _RowWidgetState createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  late New newItem;
  @override
  void initState() {
    super.initState();
    this.newItem = widget.newItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('${newItem.dateString}',
                    style: TextStyle(
                      color: lightGreyTextColor,
                      fontSize: 12.0,
                    )),
                SizedBox(
                  height: 8.0,
                ),
                Text('${newItem.textContent}',
                    style: TextStyle(color: Colors.black, fontSize: 16.0)),
                SizedBox(
                  height: 8.0,
                ),
                Text('${newItem.source}',
                    style:
                        TextStyle(color: lightGreyTextColor, fontSize: 12.0)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 1,
          child: Container(
            color: Colors.grey[200],
          ),
        )
      ],
    );
  }
}
