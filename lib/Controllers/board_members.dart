import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ir_app/Constants/constants.dart';
import 'package:ir_app/Models/BoardMembers.dart';
import 'package:http/http.dart' as http;
import 'package:ir_app/Widgets/ListTileWidget/ListTileWidgett.dart';
import 'package:ir_app/Network/api_paths.dart';

class BoardMembersListWidget extends StatefulWidget {
  String title;
  BoardMembersListWidget(this.title, {Key? key}) : super(key: key);

  @override
  _BoardMembersListWidgetState createState() => _BoardMembersListWidgetState();
}

class _BoardMembersListWidgetState extends State<BoardMembersListWidget> {
  late Future<List<Data>> futureData;

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

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Data>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data>? data = snapshot.data;
                return ListView.separated(
                    itemCount: data!.length,
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
          ),
        ),
      ),
    );
  }
}
