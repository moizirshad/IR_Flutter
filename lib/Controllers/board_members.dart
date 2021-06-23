import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ir_app/Models/BoardMembers.dart';
import 'package:http/http.dart' as http;
import 'package:ir_app/Widgets/ListTileWidget/ListTileWidgett.dart';




class BoardMembersListWidget extends StatefulWidget {
  String title;
  BoardMembersListWidget(this.title, {Key key}) : super(key: key);

  @override
  _BoardMembersListWidgetState createState() => _BoardMembersListWidgetState();
}

class _BoardMembersListWidgetState extends State<BoardMembersListWidget> {


  Future <List<Data>> futureData;

  Future <List<Data>> fetchData() async {
    final response = await http.post(
      Uri.parse('http://irapi.argaam.com/v1.1/json/InvestorsRelation/CompanyBoardManagementMembers'),
      headers: <String, String>{
        'Device-Token': 'fp3dFPTRPC7a_aYhjnR6U:APA91bHQiIsR1eF0S2kpqC6qImW0kh7xfr8e6Y57_B0rJBql3_bG6aTnCd3tTe4wX_MUQ3bxVpGJWc81FdqVpydEjZNw79t50NmGmU1G35n3_KEl9Xeqz4i6aMaBGcQ3sak2E7len0Fn',
        'App-Secret': 'F9C1C69A10C8BCF8A570C842D910B5A5',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,  String>{
        'companyPositionType':widget.title
      }
      ),
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
          child: FutureBuilder <List<Data>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data> data = snapshot.data;
                return ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTileWidgett(data, index);
                        }
                  );
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




