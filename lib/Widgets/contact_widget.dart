import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import 'package:ir_app/Models/contact_item.dart';

class ContactWidget extends StatefulWidget {
  ContactWidget({Key key, this.contactUsItem}) : super(key: key);

  final ContactUsItem contactUsItem;

  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  ContactUsItem contactUsItem;

  @override
  void initState() {
    super.initState();
    print("object");
    this.contactUsItem = widget.contactUsItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
          title: Transform(
              transform: Matrix4.translationValues(-10, -6.0, 0.0),
              child: Text(
                this.contactUsItem.titleString,
                style: TextStyle(
                    color: lightGreyTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0),
              )),
          subtitle: Transform(
              transform: Matrix4.translationValues(-10, 0.0, 0.0),
              child: Text(
                this.contactUsItem.valueString,
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0),
              )),
          leading: Transform(
            transform: Matrix4.translationValues(-16, 0.0, 0.0),
            child: Icon(
              this.contactUsItem.iconName,
              color: primaryColor,
              size: 35.0,
            ),
          )),
      Container(
        height: 1.0,
        decoration: BoxDecoration(color: lightGreyTextColor),
      )
    ]);
  }
}
