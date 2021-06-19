import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  RadioWidget({Key key}) : super(key: key);

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int _value = 1;
  List<String> strLanguage = ['English', ' العربية'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          for (int i = 0; i < strLanguage.length; i++)
            ListTile(
              title: Text(
                strLanguage[i],
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.black),
              ),
              trailing: Radio(
                value: i,
                groupValue: _value,
                activeColor: Colors.teal[900],
                onChanged: i == strLanguage.length
                    ? null
                    : (int value) {
                        setState(() {
                          _value = value;
                        });
                      },
              ),
            ),
        ],
      ),
    );
  }
}
