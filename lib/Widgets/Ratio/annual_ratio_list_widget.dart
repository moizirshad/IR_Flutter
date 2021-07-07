import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ir_app/Constants/constants.dart';
import 'package:ir_app/Models/BoardMembers.dart';
import 'package:http/http.dart' as http;
import 'package:ir_app/Network/api_paths.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:ir_app/Models/news_item.dart';
import 'package:ir_app/Widgets/header_widget.dart';
import 'package:ir_app/Widgets/Ratio/ratio_data_widget.dart';

class AnnualRatioListWidget extends StatefulWidget {
  AnnualRatioListWidget({Key? key,required this.title}) : super(key: key);
  String title;

  @override
  _AnnualRatioListWidgetState createState() => _AnnualRatioListWidgetState();
}

class _AnnualRatioListWidgetState extends State<AnnualRatioListWidget> {
  late Future<List<Data>> futureData;
  int sectionCount = 0;

  List<String> sectionsText = [
    "Per Share Data",
    "Multiiple Ratios",
    "Growth",
    "Profitability",
  ];

  List<New> shareData = [
    new New('', 'Shares Outstanding (M)', '81.00'),
    new New('', 'EPS ', '0.34'),
    new New('', 'EPS Before XO items', '0.10'),
    new New('', 'Book Value (BV) ', '0.40'),
    new New('', 'Opnening cash flow ', '(0.80)'),
  ];

  List<New> multiRatioData = [
    new New('', 'P/E', '26.54'),
    new New('', 'P/E Before Unusual Items ', '26.667'),
    new New('', 'Price/Book', '1.30'),
    new New('', 'Price/Revenue', '1.84'),
  ];

  List<New> growthData = [
    new New('', 'Assets %', '20.54'),
    new New('', 'Earnings % ', '34'),
    new New('', 'Gross Premiums written %', '10'),
    new New('', 'Net Claims Incurred % ', '(6.40)')
  ];

  List<New> profitabilityData = [
    new New('', 'Stock Market', '20.54'),
    new New('', 'Fiscal Year End ', '34'),
    new New('', 'Free Float (M)', '10'),
    new New('', 'Free Float % ', '40'),
    new New('', 'Weight in index % ', '80'),
    new New('', '3 Average Change ', '67'),
    new New('', '3M AVerage transaction ', '678'),
  ];

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
    this.sectionCount = sectionsText.length;
    print("section count == $sectionCount");
    print("sectionsText count == $sectionsText.length");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(color: pdfDisableColor),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor),
                              child: Text('SAR'),
                              onPressed: () {
                                print("SAR Button tapped");
                              },
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: pdfDisableColor,
                                  shadowColor: Colors.transparent),
                              child: Text(
                                'USD',
                                style: TextStyle(color: primaryColor),
                              ),
                              onPressed: () {
                                print("USD Button tapped");
                              },
                            ),
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
                      child: Text("2020"),
                    )
                  ],
                )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: FlutterTableView(
                sectionCount: sectionCount,
                rowCountAtSection: _rowCountAtSection,
                sectionHeaderBuilder: _sectionHeaderBuilder,
                cellBuilder: _cellBuilder,
                sectionHeaderHeight: _sectionHeaderHeight,
                cellHeight: _cellHeight,
              ),

              /* FutureBuilder<List<Data>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Data> data = snapshot.data;
                    return ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTileWidgett(data, index);
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),*/
            ),
          ),
        ]);
  }

  Future<List<Data>> fetchData() async {
    final response = await http.post(
      Uri.parse(baseUrl + apiBoardMembers),
      headers: headers,
      body: jsonEncode(<String, String>{'companyPositionType': widget.title}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = json.decode(response.body);

      return List<Data>.from(parsed["Data"].map((x) => Data.fromJson(x)));
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  // Get row count.
  int _rowCountAtSection(int section) {
    if (section == 0) {
      return shareData.length; //Per Share Data
    } else if (section == 1) {
      return multiRatioData.length; //Multiiple Ratios
    } else if (section == 2) {
      return growthData.length; //Growth
    } else if (section == 3) {
      return profitabilityData.length; //Profitability
    }
    return 0;
  }

  // Section header widget builder.
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    String text = sectionsText[section];
    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: HeaderWidget(titleText: text),
    );
  }

  // cell item widget builder.
  Widget _cellBuilder(BuildContext context, int section, int row) {
    Widget? widget;

    if (section == 0) {
      widget = dataWidget(row, shareData); //basic info
    } else if (section == 1) {
      widget = dataWidget(row, multiRatioData); //basic info
    } else if (section == 2) {
      widget = dataWidget(row, growthData); //basic info
    } else if (section == 3) {
      widget = dataWidget(row, profitabilityData); //basic info
    }

    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: widget!,
    );
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    return 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 44.0;
  }

  Widget dataWidget(int row, List<New> dataArray) {
    return Container(
      // padding: EdgeInsets.only(left: 16.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color.fromRGBO(240, 240, 240, 1),
      ))),
      height: 50.0,
      child: RatioDataWidget(
        newItem: dataArray[row],
      ),
    );
  }
}
