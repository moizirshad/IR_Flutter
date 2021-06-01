import 'package:flutter/material.dart';

class BoardMembersListWidget extends StatefulWidget {
  BoardMembersListWidget({Key key}) : super(key: key);

  @override
  _BoardMembersListWidgetState createState() => _BoardMembersListWidgetState();
}

class _BoardMembersListWidgetState extends State<BoardMembersListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Board Member A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Board Member B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Board Member C')),
          ),
        ],
      ),
    );
  }
}
