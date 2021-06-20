import 'package:flutter/material.dart';
import 'package:ir_app/Controllers/board_members.dart';
//import 'package:ir_app/Controllers/ratios.dart';

class BoardManagementWidget extends StatefulWidget {
  @override
  _BoardManagementWidgetState createState() => _BoardManagementWidgetState();
}

class _BoardManagementWidgetState extends State<BoardManagementWidget> {
  @override
  void initState() {
    super.initState();

    print('init board managment');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.teal[900],
          appBar: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  "Board Members",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Executives",
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
              BoardMembersListWidget(),
              BoardMembersListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
