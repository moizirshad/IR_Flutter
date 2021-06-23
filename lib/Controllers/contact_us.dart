import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ir_app/Widgets/contact_widget.dart';
import '../Constants/colors.dart';
import 'package:ir_app/Models/contact_item.dart';

class ContactUsWidget extends StatefulWidget {
  @override
  _ContactUsWidgetState createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  List<ContactUsItem> contactUsItems = [
    new ContactUsItem('Website', 'www.saudire.net', Icons.web),
    new ContactUsItem('Email', 'invest@saudi-re.com', Icons.email),
    new ContactUsItem('Tel', '+966 11 5102000', Icons.phone_enabled),
    new ContactUsItem(
        'Address',
        'Saudi Re for Cooperative Reinsurance Co. - 4130 Unit No 1 - Al Wadi District - Northern Ring Branch Road - Riyadh 13313, Riyadh',
        Icons.attach_email_outlined)
  ];

  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Container(
            height: 1.0,
            decoration: BoxDecoration(color: lightGreyTextColor),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Saudi Re for Cooperative Reinsurance Co.',
            style: TextStyle(
                fontSize: 19.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 80.0,
          ),
          Container(
            height: 1.0,
            decoration: BoxDecoration(color: lightGreyTextColor),
          ),
          ContactWidget(contactUsItem: this.contactUsItems[0]),
          ContactWidget(contactUsItem: this.contactUsItems[1]),
          ContactWidget(contactUsItem: this.contactUsItems[2]),
          ContactWidget(contactUsItem: this.contactUsItems[3]),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: (MediaQuery.of(context).size.width) - 16,
                    height: 60),
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.forward_to_inbox,
                    color: Colors.white,
                    size: 44.0,
                  ),
                  label: Text(
                    'Feedback',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
