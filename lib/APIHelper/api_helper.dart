import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ir_app/Constants/constants.dart';
import 'package:ir_app/Constants/helper.dart';

class APIHelper {
  static var shared = APIHelper();

  Future<dynamic> hitGetAPI(Map<String, dynamic> param, String apiPath) async {
    String url = baseUrl + apiPath;
    Map<String, String> headers = this.getGenericHeaders();

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = json.decode(response.body);
      print('parsed = $parsed');
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data from : $apiPath ");
    }

    //this.parseResponse(apiPath, response);
  }

  /*Future<dynamic> parseResponse(String apiPath, http.Response response) {
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = json.decode(response.body);
      print('parsed = $parsed');
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data from : $apiPath ");
    }
  }*/

  Future<dynamic> hitPostAPI(
      Map<String, dynamic> param, String apiPath, var dataBody) async {
    if (!Helper.isInternetAvalible) {
      throw Exception("No internet connection");
    }

    String url = baseUrl + apiPath;
    Map<String, String> headers = this.getGenericHeaders();
    var body = json.encode(dataBody);

    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = json.decode(response.body);
      print('parsed = $parsed');
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data from : $apiPath ");
    }

    // this.parseResponse(apiPath, response);
  }

//header methods
  Map<String, String> getGenericHeaders() {
    return {
      'Device-Token': deviceToken,
      'App-Secret': appSecret,
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }
}
