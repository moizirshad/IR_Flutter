import 'package:flutter/material.dart';
import 'package:ir_app/Models/news_item.dart';
import 'package:ir_app/Widgets/row_widget.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List<New> newsItems = [
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam'),
    new New(
        '11/2/20',
        'Saudi Re inks reinsurance contracts with probitas, GWPs estunnated at SAR 177 min ',
        'Argaam')
  ];

  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          var item = newsItems[index];
          return RowWidget(
            newItem: item,
          ); //RowWidget(newItem: item);
        },
      ),
    );
  }
}
