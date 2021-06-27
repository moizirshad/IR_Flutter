import 'package:flutter/material.dart';
import 'package:ir_app/Constants/constants.dart';
import 'package:ir_app/Widgets/overview_management_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ir_app/Models/news_item.dart';

class StatisticsWidget extends StatefulWidget {
  StatisticsWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  String url;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.url = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _webViewContainer(chartURL, 300),
    );
  }

  Widget _webViewContainer(String url, double height) {
    return Container(
      //for graph
      height: height,
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finish) {
          setState(() {
            isLoading = false;
          });
        },
      ),
    );
  }
}

class ManagmentTabWidget extends StatefulWidget {
  ManagmentTabWidget({Key key, this.marketData}) : super(key: key);

  final List<New> marketData;

  @override
  _ManagmentTabWidgetState createState() => _ManagmentTabWidgetState();
}

class _ManagmentTabWidgetState extends State<ManagmentTabWidget> {
  List<New> marketData = [];

  @override
  void initState() {
    super.initState();

    this.marketData = widget.marketData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _tabBar(),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 200,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.green[600],
          appBar: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  "Market Data",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Financial Ratios",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListView.builder(
                  itemCount: this.marketData.length,
                  itemBuilder: (context, index) {
                    var item = this.marketData[index];
                    return OverviewData(newItem: item);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListView.builder(
                  itemCount: this.marketData.length,
                  itemBuilder: (context, index) {
                    var item = this.marketData[index];
                    return OverviewData(newItem: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
