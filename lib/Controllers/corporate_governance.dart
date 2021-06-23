import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:ir_app/Constants/colors.dart';

class CorporateGovernanceWidget extends StatefulWidget {
  @override
  _CorporateGovernanceWidgetState createState() =>
      _CorporateGovernanceWidgetState();
}

class _CorporateGovernanceWidgetState extends State<CorporateGovernanceWidget> {
  List<String> sectionsText = [
    "لكن لا بد أن أوضح لك أن كل",
    'المغلوطة حول استنكار  النشوة وتمجيد',
    "وأكرر بأنه لا يوجد من يرغب في "
  ];

  List<List<String>> rowText = [
    [' مثال حي لهذا، من منا لم يتحمل جهد بدني '],
    [
      '2018 مثال حي لهذا، من منا لم يتحمل جهد بدني ',
      '2019 ك السعادة البشرية، فلا أحد يرفض أو يكره',
      '2020 من يرغب في الحب ونيل المنال ويتلذذ بالآلام'
    ],
    [
      ' مثال حي لهذا، من منا لم يتحمل جهد بدني ',
      'ك السعادة البشرية، فلا أحد يرفض أو يكره',
      ' من يرغب في الحب ونيل المنال ويتلذذ بالآلام',
      ' مثال حي لهذا، من منا لم يتحمل جهد بدني ',
    ],
  ];

  int sectionCount = 0;

  // Get row count.
  int _rowCountAtSection(int section) {
    return rowText[section].length;
  }

  @override
  void initState() {
    super.initState();

    print('create state callled');
    this.sectionCount = sectionsText.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      //FlutterTableView
      child: FlutterTableView(
        sectionCount: sectionCount,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
      ),
    );
  }

  // Section header widget builder.
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        color: Colors.grey[400].withOpacity(0.3),
        height: 100,
        child: Text(
          sectionsText[section],
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: black_text),
        ),
      ),
    );
  }

  // cell item widget builder.
  Widget _cellBuilder(BuildContext context, int section, int row) {
    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color.fromRGBO(240, 240, 240, 1),
        ))),
        height: 50.0,
        child: Row(
          children: [
            Icon(
              Icons.picture_as_pdf,
              color: Colors.red[700],
              size: 24.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              rowText[section][row],
              style: TextStyle(fontSize: 16.0, color: black_text),
            ),
          ],
        ),
      ),
    );
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    return 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 50.0;
  }
}
