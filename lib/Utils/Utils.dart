import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getValueForKeyAsync(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString(key);
  return stringValue;
}

getValueForKey(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString(key);
  return stringValue;
}

setValueForKey(String value, String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

getCurrentTextDirection() {
  return getValueForKey('Language') == 'ar'
      ? TextDirection.ltr
      : TextDirection.rtl;
}
