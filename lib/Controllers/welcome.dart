import 'package:flutter/material.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:ir_app/Controllers/board_management.dart';
import 'package:ir_app/Controllers/calendar.dart';
import 'package:ir_app/Controllers/contact_us.dart';
import 'package:ir_app/Controllers/corporate_governance.dart';
import 'package:ir_app/Controllers/financial_reports.dart';
import 'package:ir_app/Controllers/financial_statements.dart';
import 'package:ir_app/Controllers/major_shareholders.dart';
import 'package:ir_app/Controllers/news.dart';
import 'package:ir_app/Controllers/overview.dart';
import 'package:ir_app/Controllers/profile.dart';
import 'package:ir_app/Controllers/ratios.dart';
import 'package:ir_app/Controllers/settings.dart';
import 'package:ir_app/Controllers/webview_page.dart';
import 'package:share/share.dart';

class WelcomeWidget extends StatefulWidget {
  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  var menuList = [
    'Overview',
    'Profile',
    'Board Management',
    'Major Shareholders',
    'Financial Statement',
    'Ratios',
    'Financial Reports',
    'News',
    'Calendar',
    'Corporate Governance',
    'The Article of Assassination',
    'Settings',
    'Contact US',
    'Share App'
  ];

  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time,Icons.access_time,Icons.access_time,Icons.access_time,
    Icons.access_time,Icons.access_time,Icons.access_time,Icons.access_time,Icons.access_time,Icons.access_time,Icons.access_time,Icons.access_time];


  List<Widget> controllers = <Widget>[
    OverViewWidget(),
    ProfileWidget(),
    BoardManagementWidget(),
    MajorShareHoldersWidget(),
    FinancialStatementsWidget(),
    RatiosWidget(),
    FinancialReportsWidget(),
    NewsWidget(),
    CalendarWidget(),
    CorporateGovernanceWidget(),
    WebViewPageWidget(title: 'https://www.google.com/'),
    SettingsWidget(),
    ContactUsWidget()
  ];
  Widget visiableWidget = OverViewWidget();

  String appBarTitle = "Overview";
  void menuChanged(int index) {
    setState(() {
      appBarTitle = this.menuList[index];
      visiableWidget = this.controllers[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '$appBarTitle',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.6,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.teal[900],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: this.visiableWidget,
        ),
        drawer: getDrawer());
  }

  Widget _createHeader() {
    return Container(
      height: 150,
      child: DrawerHeader(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Image(
            image: AssetImage('assets/logo.png'),
          ),
        ),
      ),
    );
  }

  Widget _listBuilder() {
    return Container(
      color: primaryColor,
      child: ListView.builder(
          itemCount: this.menuList.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _createHeader();
            }
            return ListTile(
              tileColor: primaryColor,
              leading: Icon(icons[index-1],color: Colors.blueGrey),
             // leading: Icon(Icons.settings, color: Colors.white),
              onTap: () {
                if (index == this.menuList.length) {
                  Share.share("App Share Link");
                } else {
                  this.menuChanged(index - 1);
                }
                Navigator.pop(context);
              },
              title: Text(
                menuList[index - 1],
                style: TextStyle(
                  color: bgColor,
                  letterSpacing: 0.6,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
    );
  }

  Widget getDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(child: _listBuilder()),
            Container(
              height: 0.5,
              color: bgColor,
            ),
            Container(
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Powered by ',
                        style: TextStyle(
                            fontStyle: FontStyle.normal, color: bgColor)),
                    TextSpan(
                        text: ' Argaam.com',
                        // recognizer: GestureRecognizer(),
                        style: TextStyle(
                            color: Colors.orange[300],
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              alignment: Alignment.center,
              height: 30,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
