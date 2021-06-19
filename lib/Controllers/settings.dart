import 'package:flutter/material.dart';
import 'package:ir_app/Widgets/settings_switched_widget.dart';
import 'package:ir_app/Widgets/settings_radio_widget.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  void initState() {
    super.initState();

    print('create state callled');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: _createHeader(),
    );
  }

  Widget _createHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getNotificationWidget(),
        getLanguageWiget(),
        Container(
            margin: EdgeInsets.all(10.0),
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(6, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Version',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                  Text('1.0')
                ],
              ),
            ))
      ],
    );
  }

  Widget getNotificationWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: Text(
            'Notification',
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          height: 86.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(6, 6),
              ),
            ],
          ),
          child: Column(children: [
            SwitchedWidget(
              isSwitched: false,
              textTitle: "Breaking News",
            ),
            Container(
                height: 1.0,
                decoration: BoxDecoration(color: Colors.grey[100])),
            SwitchedWidget(
              isSwitched: false,
              textTitle: "Events",
            )
          ]),
        ),
      ],
    );
  }

  Widget getLanguageWiget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: Text(
            'Language',
            style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(6, 6),
              ),
            ],
          ),
          child: RadioWidget(),
        ),
      ],
    );
  }
}
