import 'package:flutter/material.dart';
import 'package:ir_app/Constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatefulWidget {
  WebviewWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WebviewWidgetState createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
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
          _webViewContainer(chartURL, 100),
        ],
      ),
    );
  }



  Widget _webViewContainer(String url, double height) {
    return Container(
      //for graph
      height: height,
     // decoration: BoxDecoration(color: Colors.amber),
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
