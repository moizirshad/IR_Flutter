import 'package:flutter/material.dart';
import 'package:ir_app/Widgets/Ratio/annual_ratio_list_widget.dart';

class RatiosWidget extends StatefulWidget {
  @override
  _RatiosWidgetState createState() => _RatiosWidgetState();
}

class _RatiosWidgetState extends State<RatiosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.teal[900],
          appBar: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  "Annual",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "TTM",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Annualized",
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
              AnnualRatioListWidget(
                title: "Annual",
              ),
              AnnualRatioListWidget(
                title: "Annual",
              ),
              AnnualRatioListWidget(
                title: "Annual",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
