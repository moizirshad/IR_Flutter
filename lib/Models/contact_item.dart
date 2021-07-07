import 'package:flutter/material.dart';

class ContactUsItem {
  String? titleString;
  String? valueString;
  IconData? iconName;

  ContactUsItem(String titleString, String valueString, IconData iconData) {
    this.titleString = titleString;
    this.valueString = valueString;
    this.iconName = iconData;
  }
}
