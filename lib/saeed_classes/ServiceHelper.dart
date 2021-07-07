import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ir_app/Network/api_paths.dart';
import 'package:ir_app/saeed_classes/utils_helper.dart';

class ServiceHelper {

  static Future<dynamic> apiCall(BuildContext context,String url) async {

    if (!Utilshelper.isInternetAvalible) {
      Utilshelper.showToast(context, "No internet connection");
      throw Exception("No internet connection");
    }
    final response = await http.get(Uri.parse(url), headers: ApiUrls.headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<dynamic> postApiCall(BuildContext context,String url,var dataBody) async {

    if (!Utilshelper.isInternetAvalible) {
      Utilshelper.showToast(context, "No internet connection");
      throw Exception("No internet connection");
    }

    var body = json.encode(dataBody);

    var response = await http.post(Uri.parse(url),
        headers:ApiUrls.headers,
        body: body
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
