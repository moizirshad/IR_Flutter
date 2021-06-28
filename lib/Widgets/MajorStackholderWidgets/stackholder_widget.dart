import 'package:flutter/material.dart';
import 'package:ir_app/Constants/colors.dart';

import 'package:ir_app/Models/stackholder.dart';

class StackHolderWidgt extends StatefulWidget {
  StackHolderWidgt({Key key, this.stackholderItem}) : super(key: key);

  final StackholderItem stackholderItem;

  @override
  _StackHolderWidgtState createState() => _StackHolderWidgtState();
}

class _StackHolderWidgtState extends State<StackHolderWidgt> {
  StackholderItem stackholderItem;
  @override
  void initState() {
    super.initState();
    this.stackholderItem = widget.stackholderItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  border: Border.all(
                    width: 1.0,
                    color: Colors.green[50],
                  ),
                ),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          stackholderItem.name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Text(
                          stackholderItem.type,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: Colors.green[50],
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Row(
                        children: [
                          Text(
                            'No of Shares (M)',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: grey_text),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Text(
                            stackholderItem.numOfShares,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: black_text),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Column(children: [
                      Row(
                        children: [
                          Text(
                            'Holding',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: grey_text),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Text(
                            stackholderItem.holding,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: black_text),
                          ),
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
