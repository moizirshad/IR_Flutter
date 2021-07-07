import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';

class Utilshelper {
  static String _connectionStatus = 'Unknown';
  static bool isInternetAvalible = false;

  static void showToast(BuildContext context, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    } else {
      return false;
    }
  }

  static bool isTextNullOrEmpty(String text) {
    if (text == null) {
      return true;
    }
    if (text.isEmpty) {
      return true;
    }
    if (text.trim() == "") {
      return true;
    }
    if (text.trim() == "null") {
      return true;
    }
    return false;
  }

  static String isTextNullOrEmptyString(String text) {
    if (text == null) {
      return "";
    }
    if (text.isEmpty) {
      return "";
    }
    if (text.trim() == "") {
      return "";
    }
    if (text.trim() == "null") {
      return "";
    }
    return text.trim();
  }

  static bool isJsonEmpty(BuildContext context, String json) {
    if (!isTextNullOrEmpty(json)) {
      return false;
    } else {
      Utilshelper.showToast(context, "Error");
      return true;
    }
  }

  static void isInternetConnectedListner() {
    Connectivity _connectivity = Connectivity();
    initConnectivity(_connectivity);
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  static Future<void> initConnectivity(Connectivity connectivity) async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result);
  }

  static int getLanguageId(BuildContext context) {
    return 2;
  }

  static bool isArabicLang(BuildContext context) {
    if (getLanguageId(context) == 2) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        isInternetAvalible = true;
        _connectionStatus = result.toString();
        break;
      case ConnectivityResult.mobile:
        isInternetAvalible = true;
        _connectionStatus = result.toString();
        break;
      case ConnectivityResult.none:
        isInternetAvalible = false;
        _connectionStatus = result.toString();
        break;
      default:
        isInternetAvalible = false;
        _connectionStatus = 'Failed to get connectivity.';
        break;
    }
  }
}
