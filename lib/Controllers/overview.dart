import 'package:flutter/material.dart';
import 'package:ir_app/APIHelper/api_helper.dart';
import 'package:ir_app/Statistics/statistics_widget.dart';
import 'package:ir_app/Models/news_item.dart';
import 'package:ir_app/Widgets/row_widget.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:ir_app/APIHelper/api_helper.dart';
import 'package:ir_app/APIHelper/api_paths.dart';
import 'package:ir_app/Models/base_response.dart';
import 'package:ir_app/Models/company_chart_item.dart';
import 'dart:convert';
import 'package:ir_app/Models/BoardMembers.dart';
import 'package:ir_app/Widgets/header_widget.dart';

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
      return newsItems.length > 3 ? 4 : newsItems.length;
    } else if (section == 2) {
      return 1;
    } else if (section == 3) {
      return newsItems.length > 3 ? 4 : newsItems.length;
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
    Widget sectionHeaderWidget;

    if (section == 0) {
      sectionHeaderWidget = overViewHeader();
    } else {
      sectionHeaderWidget = HeaderWidget(
        titleText: sectionsText[section],
      );
    }

    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: sectionHeaderWidget,
    );
  }

  // cell item widget builder.
  Widget _cellBuilder(BuildContext context, int section, int row) {
    if (section == 0) {
      return InkWell(
          onTap: () {
            print('click cell item. -> section:$section row:$row');
          },
          child: getChartData()); // StatisticsWidget());
    } else if (section == 1) {
      if (row == 3) {
        return InkWell(
            onTap: () {
              print('click cell item. -> section:$section row:$row');
            },
            child: moreRow('News Controller'));
      } else {
        return InkWell(
            onTap: () {
              print('click cell item. -> section:$section row:$row');
            },
            child: newsRow(row));
      }
    } else if (section == 2) {
      return InkWell(
          onTap: () {
            print('click cell item. -> section:$section row:$row');
          },
          child: ManagmentTabWidget(marketData: this.marketData));
    } else if (section == 3) {
      if (row == 3) {
        return InkWell(
            onTap: () {
              print('click cell item. -> section:$section row:$row');
            },
            child: moreRow('Analytics'));
      } else {
        return InkWell(
            onTap: () {
              print('click cell item. -> section:$section row:$row');
            },
            child: newsRow(row));
      }
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
      return row == 3 ? 44 : 104.0;
    } else if (section == 2) {
      return this.marketData.length * 60.0;
    } else if (section == 3) {
      return row == 3 ? 44 : 104.0;
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

  Widget moreRow(String controllerName) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
      child: Text("More"),
      onPressed: () {
        print('more to $controllerName');
      },
    );
  }

  Widget overViewHeader() {
    return Container(
      decoration: BoxDecoration(color: Colors.green[50]),
      child: Column(
        children: [
          Container(
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
            height: 60.0,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '0.14',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: black_text,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Last',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: black_text,
                        ),
                      ),
                    ],
                  ),
                )),
                VerticalDivider(
                  width: 1.0,
                  color: Colors.grey,
                ),
                change('up', '18.5'),
                VerticalDivider(
                  width: 1.0,
                  color: Colors.grey,
                ),
                change('low', '10.4'),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget change(String changeType, String value) {
    Widget changeWidget;
    Color changeColor;

    if (changeType == 'up') {
      changeColor = Colors.green[300];
      changeWidget = Icon(Icons.arrow_circle_up, color: changeColor);
    } else if (changeType == 'low') {
      changeColor = Colors.red;
      changeWidget = Icon(Icons.arrow_circle_down, color: changeColor);
    }

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: changeColor,
                  ),
                ),
              ),
              changeWidget,
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
    ));
  }
}

// class getChartData extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: APIHelper.shared.hitGetAPI({}, apiCompanyChart),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           print("snapshot.data == $snapshot.data");
//           // mapping
//           return RowWidget();
//         } else {
//           return RowWidget();
//         }
//       },
//     );
//     /* return FutureBuilder(
//       future: ServiceHelper.apiCall(context, ApiUrls.CompanyChart),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           var responseApi = CompanyChartEnt().getData(snapshot.data);
//           return WebViewWidget(responseApi.ChartUrlEn.toString(), true);
//         } else {
//           return CircularProgressBar();
//         }
//       },
//     );*/
//   }
// }

class getChartData extends StatefulWidget {
  getChartData({Key key}) : super(key: key);

  @override
  _getChartDataState createState() => _getChartDataState();
}

class _getChartDataState extends State<getChartData> {
  Future<List<Data>> futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("createdgetChartData");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var responseApi = CompanyChartItem().getData(snapshot.data);

          print("aasna  $responseApi");
          return StatisticsWidget(
            title: 'htttp://google.com',
          ); //WebViewWidget(responseApi.ChartUrlEn.toString(), true);
        } else {
          print("aasna has no data   $snapshot");

          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<List<Data>> fetchData() async {
    final response = await APIHelper.shared.hitPostAPI({}, apiBoardMembers, {});

    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = json.decode(response.body);

      return List<Data>.from(parsed["Data"].map((x) => Data.fromJson(x)));
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
