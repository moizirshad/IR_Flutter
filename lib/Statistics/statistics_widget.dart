import 'package:flutter/material.dart';
import 'package:ir_app/Constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      child: Column(
        children: [
          _topHeader(),
          _webViewContainer(chartURL, 300),
          _tabBar(),
        ],
      ),
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
              Text('ssdsd'),
              Text('yahoo'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _webViewContainer(String url, double height) {
    return Container(
      //for graph
      height: height,
      decoration: BoxDecoration(color: Colors.amber),
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

  Widget _topHeader() {
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
                  color: Colors.black,
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
                          color: Colors.black,
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
