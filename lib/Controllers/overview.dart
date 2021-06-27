import 'package:flutter/material.dart';
import 'package:ir_app/Statistics/statistics_widget.dart';
import 'package:ir_app/Models/news_item.dart';
import 'package:ir_app/Widgets/row_widget.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:ir_app/Constants/colors.dart';

class OverViewWidget extends StatefulWidget {
  @override
  _OverViewWidgetState createState() => _OverViewWidgetState();
}

class _OverViewWidgetState extends State<OverViewWidget> {
  List<String> sectionsText = ["", 'Latest News', "", "Analyst Estimates"];

  List<New> newsItems = [
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam')
  ];

  List<New> marketData = [
    new New('11/2/20', 'Last Trade', '20.54'),
    new New('11/2/20', 'Change ', '34'),
    new New('11/2/20', 'Open', '10'),
    new New('11/2/20', 'Low ', '40'),
    new New('11/2/20', 'High ', '80'),
    new New('11/2/20', 'Change ', '67'),
    new New('11/2/20', 'Change ', '678'),
    new New('11/2/20', 'Volumn ', '78'),
    new New('11/2/20', 'Turnover ', '23'),
    new New('11/2/20', 'Transactions ', '8640'),
    new New('11/2/20', 'Market Value ', '34'),
    new New('11/2/20', 'Average Volumn (12M)% ', '345'),
    new New('11/2/20', 'Avg Turnover (12M)%', '233.2'),
    new New('11/2/20', 'Avg Transactions ', '64.4'),
    new New('11/2/20', 'Change (12M)% ', '34.4'),
    new New('11/2/20', 'YTD % ', '154.4'),
  ];

  int sectionCount = 3;

  @override
  void initState() {
    super.initState();

    print('create state callled');
    this.sectionCount = sectionsText.length;
  }

  // Get row count.
  int _rowCountAtSection(int section) {
    if (section == 0) {
      return 1;
    } else if (section == 1) {
      return newsItems.length;
    } else if (section == 2) {
      return 1;
    } else if (section == 3) {
      return newsItems.length;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
      ),
    );
  }

  // Section header widget builder.
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    if (section == 0) {
      return InkWell(
        onTap: () {
          print('click section header. -> section:$section');
        },
        child: overViewHeader(),
      );
    }
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
    if (section == 0) {
      return InkWell(
          onTap: () {
            print('click cell item. -> section:$section row:$row');
          },
          child: StatisticsWidget());
    } else if (section == 1) {
      return InkWell(
          onTap: () {
            print('click cell item. -> section:$section row:$row');
          },
          child: newsRow(row));
    } else if (section == 2) {
      return InkWell(
          onTap: () {
            print('click cell item. -> section:$section row:$row');
          },
          child: ManagmentTabWidget(marketData: this.marketData));
    } else if (section == 3) {
      return InkWell(
          onTap: () {
            print('click cell item. -> section:$section row:$row');
          },
          child: newsRow(row));
    }
    return InkWell(
        onTap: () {
          print('click cell item. -> section:$section row:$row');
        },
        child: newsRow(row));
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    if (section == 0) {
      return 103.0;
    }
    if (section == 2) {
      return 0.0;
    }
    return 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    if (section == 0) {
      return 300.0;
    } else if (section == 1) {
      return 104.0;
    } else if (section == 2) {
      return this.marketData.length * 60.0;
    } else if (section == 3) {
      return 104.0;
    }

    return 0;
  }

  Widget newsRow(int row) {
    return Container(
      padding: EdgeInsets.only(left: 16.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color.fromRGBO(240, 240, 240, 1),
      ))),
      height: 50.0,
      child: RowWidget(
        newItem: newsItems[row],
      ),
    );
  }

  Widget overViewHeader() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.green[50]),
          height: 40.0,
          child: Center(
            child: Text(
              'Saudi Re for Cooperative Reinsurance Co.',
              style: TextStyle(
                  fontSize: 16.0,
                  color: black_text,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
        Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.green[50]),
          height: 60.0,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '11.20',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: black_text,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Last',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[800],
                        ),
                      )
                    ],
                  ),
                ),
              )),
              VerticalDivider(
                width: 1.0,
                color: Colors.grey,
              ),
              Expanded(
                  child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_up,
                            color: Colors.green[300],
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '0.14',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[300],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Change',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              VerticalDivider(
                width: 1.0,
                color: Colors.grey,
              ),
              Expanded(
                  child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '11.20',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Change',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[800],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
        Divider(
          height: 1.0,
          color: Colors.grey,
        )
      ],
    );
  }
}

class DecoratedContainer extends StatefulWidget {
  DecoratedContainer({Key key}) : super(key: key);

  @override
  _DecoratedContainerState createState() => _DecoratedContainerState();
}

class _DecoratedContainerState extends State<DecoratedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green[50]),
      child: null,
    );
  }
}
