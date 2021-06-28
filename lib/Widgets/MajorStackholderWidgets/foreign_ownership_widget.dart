import 'package:flutter/material.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:ir_app/Models/foreign_ownership_item.dart';

class ForeignOwernershipWidget extends StatefulWidget {
  ForeignOwernershipWidget({Key key, this.foreignOwnershipItem})
      : super(key: key);

  final ForeignOwnershipItem foreignOwnershipItem;

  @override
  _ForeignOwernershipWidgetState createState() =>
      _ForeignOwernershipWidgetState();
}

class _ForeignOwernershipWidgetState extends State<ForeignOwernershipWidget> {
  ForeignOwnershipItem foreignOwnershipItem;
  @override
  void initState() {
    super.initState();
    this.foreignOwnershipItem = widget.foreignOwnershipItem;
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
                          foreignOwnershipItem.name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Maximum Limit',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: grey_text),
                        ),
                        SizedBox(width: 40),
                        Text(
                          'Actual',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: grey_text),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                )),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: Colors.green[50],
                ),
              ),
              padding: EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Row(
                        children: [
                          Text(
                            'Total Foreign Ownership',
                            style: TextStyle(fontSize: 16.0, color: grey_text),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Column(children: [
                    Row(
                      children: [
                        Text(
                          foreignOwnershipItem.maxLimit,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: black_text),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          Text(
                            foreignOwnershipItem.actual,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: black_text),
                          ),
                        ],
                      ),
                    ),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
