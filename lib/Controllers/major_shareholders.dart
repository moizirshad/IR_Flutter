import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:ir_app/Models/stackholder.dart';
import 'package:ir_app/Models/foreign_ownership_item.dart';
import 'package:ir_app/Widgets/MajorStackholderWidgets/foreign_ownership_widget.dart';
import 'package:ir_app/Widgets/MajorStackholderWidgets/stackholder_widget.dart';

class MajorShareHoldersWidget extends StatefulWidget {
  @override
  _MajorShareHoldersWidgetState createState() =>
      _MajorShareHoldersWidgetState();
}

class _MajorShareHoldersWidgetState extends State<MajorShareHoldersWidget> {
  List<String> sectionsText = ["", "Foreign Ownership"];

  List<StackholderItem> stackholderItems = [
    new StackholderItem(
        'Al Qasabi Contracting Co. Ltd', 'Institution', '4.05', '5.00 %'),
  ];

  List<ForeignOwnershipItem> foreignOwnershipItems = [
    new ForeignOwnershipItem(
        'Saudi Re for Cooperative Reinsurance Co.', '49 %', '4.39 %'),
  ];

  int sectionCount = 0;

  // Get row count.
  int _rowCountAtSection(int section) {
    if (section == 0) {
      return stackholderItems.length;
    }
    return foreignOwnershipItems.length;
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
    Widget shareholderWidget;

    if (section == 0) {
      shareholderWidget = stackHolderWidget(row);
    } else {
      shareholderWidget = foreignOwnershipWidget(row);
    }

    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: shareholderWidget,
    );
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    return section == 0 ? 0.0 : 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 150.0;
  }

  Widget stackHolderWidget(int row) {
    var stackholderItem = this.stackholderItems[row];

    return StackHolderWidgt(
      stackholderItem: stackholderItem,
    );
  }

  Widget foreignOwnershipWidget(int row) {
    var foreignOwnershipItem = this.foreignOwnershipItems[row];

    return ForeignOwernershipWidget(
      foreignOwnershipItem: foreignOwnershipItem,
    );
  }
}
