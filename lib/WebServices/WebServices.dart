// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:ir_app/Models/BoardMembers.dart';
// import 'package:http/http.dart' as http;
//
//
//
// class WebServices extends StatefulWidget {
//
//   var Title;
//   Future <List<Data>> futureData;
//   WebServices(this.Title);
//
//   @override
//   _WebServicesState createState() => _WebServicesState();
// }
//
// class _WebServicesState extends State<WebServices> {
//   @override
//   Widget build(BuildContext context) {
//     return fetchData(Title);
//   }
// }
//
//
//
// Future <List<Data>> fetchData( String title) async {
//   final response = await http.post(
//     Uri.parse('http://irapi.argaam.com/v1.1/json/InvestorsRelation/CompanyBoardManagementMembers'),
//     headers: <String, String>{
//       'Device-Token': 'fp3dFPTRPC7a_aYhjnR6U:APA91bHQiIsR1eF0S2kpqC6qImW0kh7xfr8e6Y57_B0rJBql3_bG6aTnCd3tTe4wX_MUQ3bxVpGJWc81FdqVpydEjZNw79t50NmGmU1G35n3_KEl9Xeqz4i6aMaBGcQ3sak2E7len0Fn',
//       'App-Secret': 'F9C1C69A10C8BCF8A570C842D910B5A5',
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String,  String>{
//       'companyPositionType':title
//     }
//     ),
//   );
//
//   if (response.statusCode == 200) {
//     final Map<String, dynamic> parsed = json.decode(response.body);
//
//     return List<Data>.from(parsed["Data"].map((x) => Data.fromJson(x)));
//   } else {
//     throw Exception('Unexpected error occured!');
//   }
//
//
// }
//
