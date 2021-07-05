import 'package:flutter/material.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:ir_app/Models/stackholder.dart';
import 'package:ir_app/Models/news_item.dart';
import 'package:ir_app/Widgets/MajorStackholderWidgets/stackholder_widget.dart';
import 'package:ir_app/Widgets/row_widget.dart';
import 'package:ir_app/Widgets/overview_management_widget.dart';
import 'package:ir_app/Widgets/Profile/CustomCard.dart';
import 'package:ir_app/Widgets/header_widget.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  int sectionCount = 0;

  List<String> sectionsText = [
    "Business",
    "Basic Information",
    "Financial Highlights (M)",
    "Trading Data",
    "Major Stackholders",
    "Subsidiaries & Associates",
    "Milestones"
  ];

  List<New> basicInfo = [
    new New('', 'City', 'Riyadh'),
    new New('', 'Owenership type  ', 'Joint Stock'),
    new New('', 'Year', '2009'),
    new New('', 'Email ', 'invest@saudire.com'),
    new New('', 'Phone number ', '+965 334343'),
    new New('', 'Fax ', '+987 2323234'),
    new New('', 'Address ', '4130 Unit no 1 - Al-Wadi Dirstrict '),
  ];

  List<StackholderItem> financialHighlightsItems = [
    new StackholderItem(
        'Gross Premiums written', 'Institution', '598.22', '792.85'),
    new StackholderItem(
        'Net surplus from insurance op', 'Institution', '3.43', '3.51'),
    new StackholderItem('Net income', 'Institution', '45.92', '45.44'),
    new StackholderItem(
        'Share outstanding1 (Million)', 'Institution', '81.00', '81.00')
  ];

  List<New> tradingData = [
    new New('', 'Stock Market', '20.54'),
    new New('', 'Fiscal Year End ', '34'),
    new New('', 'Free Float (M)', '10'),
    new New('', 'Free Float % ', '40'),
    new New('', 'Weight in index % ', '80'),
    new New('', '3 Average Change ', '67'),
    new New('', '3M AVerage transaction ', '678'),
  ];

  List<StackholderItem> stackholderItems = [
    new StackholderItem(
        'Al Qasabi Contracting Co. Ltd', 'Institution', '4.05', '5.00 %')
  ];

  List<New> subsidariesData = [
    new New('', 'Propetaz Bermuda Holdings', '49.99 %'),
  ];

  List<New> milestones = [
    new New(
        '11/2/20',
        'Capital reduced from SAR 1 bin to SAR 810 min by cancellation of 19 million shares ',
        'Argaam'),
    new New(
        '11/2/20', 'Floated on the saudi stock market (Tadawul) ', 'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam')
  ];

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

  // Get row count.
  int _rowCountAtSection(int section) {
    if (section == 0) {
      return 1; //business
    } else if (section == 1) {
      return basicInfo.length; //basic info
    } else if (section == 2) {
      return financialHighlightsItems.length; //financial
    } else if (section == 3) {
      return tradingData.length; //trading data
    } else if (section == 4) {
      return stackholderItems.length + 1; //stackholders
    } else if (section == 5) {
      return subsidariesData.length; //subsidiaries
    } else if (section == 6) {
      return milestones.length; //milestones
    }
    return 0;
  }

  // Section header widget builder.
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    Widget headerWidget;
    String text = sectionsText[section];

    if (section == 2) {
      headerWidget = financialHeaderWidget(text);
    } else if (section == 4) {
      //stackholders
      headerWidget = stackholderHeaderWidget(text);
    } else if (section == 5) {
      //subsidiaries
      headerWidget = subsidiariesHeaderWidget(text);
    } else {
      headerWidget = HeaderWidget(titleText: text);
    }

    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: headerWidget,
    );
  }

  // cell item widget builder.
  Widget _cellBuilder(BuildContext context, int section, int row) {
    Widget widget;

    if (section == 0) {
      widget = Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child:
            Text('The Company provides insuarance and reinsurance services.'),
      ); //business
    } else if (section == 1) {
      widget = dataWidget(row, basicInfo); //basic info
    } else if (section == 2) {
      widget =
          profileStackholderWidget(row, financialHighlightsItems); //financial
    } else if (section == 3) {
      widget = dataWidget(row, tradingData); //basic info
    } else if (section == 4) {
      if (row == 1) {
        widget = moreRow('controllerName');
      } else {
        widget = profileStackholderWidget(row, stackholderItems);
      }
    } else if (section == 5) {
      widget = dataWidget(row, subsidariesData); //subsidiaries
    } else if (section == 6) {
      widget = newsRow(row, milestones); //milestones
    }

    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: widget,
    );
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    if (section == 2) {
      return 85; //stackholders
    } else if (section == 4) {
      return 85; //stackholders
    } else if (section == 5) {
      return 80; //subsidiaries
    }
    return 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    if (section == 0) {
      return 60.0; //business
    } else if (section == 1) {
      return 44.0; //basic info
    } else if (section == 2) {
      return 50.0; //financial
    } else if (section == 3) {
      return 44.0; //trading data
    } else if (section == 4) {
      return row == 1 ? 44 : 50; //stackholders
    } else if (section == 5) {
      return 44.0; //subsidiaries
    } else if (section == 6) {
      return 104.0; //milestones
    }

    return 0;
  }

  Widget stackHolderWidget(int row) {
    var stackholderItem = this.stackholderItems[row];

    return StackHolderWidgt(
      stackholderItem: stackholderItem,
    );
  }

  Widget newsRow(int row, List<New> dataArray) {
    return Container(
      //    padding: EdgeInsets.only(left: 16.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color.fromRGBO(240, 240, 240, 1),
      ))),
      height: 50.0,
      child: RowWidget(
        newItem: dataArray[row],
      ),
    );
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
      child: OverviewData(
        newItem: dataArray[row],
      ),
    );
  }

  Widget profileStackholderWidget(int row, List<StackholderItem> dataArray) {
    StackholderItem stackholder = dataArray[row];

    return Container(
      //  padding: EdgeInsets.only(left: 16.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color.fromRGBO(240, 240, 240, 1),
      ))),
      height: 50.0,
      child: ProfileStackholderWidget(stackholderItem: stackholder),
    );
  }

  Widget moreRow(String controllerName) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bulb.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.grey[100], shadowColor: Colors.white),
        child: Text('More', style: TextStyle(color: black_text)),
        onPressed: () {
          print('more to $controllerName');
        },
      ) /* add child content here */,
    );
    ;
  }

  //Header Widgets
  Widget financialHeaderWidget(String text) {
    return Column(
      children: [
        Container(
            height: 50,
            child: HeaderWidget(
              titleText: text,
            )),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16.0, top: 8),
          color: Colors.grey[400].withOpacity(0.2),
          height: 30,
          child: Row(children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: black_text),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  "< 2020      2019 >",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: black_text),
                ),
              ],
            ),
            SizedBox(width: 12),
          ]),
        ),
        Container(
          color: Colors.grey[400].withOpacity(0.4),
          height: 1.0,
        ),
      ],
    );
  }

  Widget stackholderHeaderWidget(String text) {
    return Column(
      children: [
        Container(
            height: 50,
            child: HeaderWidget(
              titleText: text,
            )),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16.0, top: 8),
          color: Colors.grey[400].withOpacity(0.2),
          height: 30,
          child: Row(children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: black_text),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  "Number of Shares(M)",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: black_text),
                ),
              ],
            ),
            SizedBox(width: 12),
            Column(
              children: [
                Text(
                  "Holding",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: black_text),
                ),
              ],
            ),
            SizedBox(width: 12),
          ]),
        ),
        Container(
          color: Colors.grey[400].withOpacity(0.4),
          height: 1.0,
        ),
      ],
    );
  }

  Widget subsidiariesHeaderWidget(String text) {
    return Column(children: [
      Container(
        height: 50,
        child: HeaderWidget(
          titleText: text,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0, top: 8),
        color: Colors.grey[400].withOpacity(0.2),
        height: 30,
        child: Row(children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Company",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: black_text),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Column(
            children: [
              Text(
                "Percentage",
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: black_text),
              ),
            ],
          ),
          SizedBox(width: 12),
        ]),
      ),
    ]);
  }
}
