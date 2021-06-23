import 'package:flutter/material.dart';
import 'package:ir_app/Statistics/statistics_widget.dart';
import 'package:ir_app/Widgets/Profile/CustomCard.dart';
import 'package:ir_app/Widgets/Profile/HeaderWidget.dart';
import 'package:ir_app/Widgets/Webview/webview.dart';


class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();

    print('create state csllled');
  }




  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
        child: Column(
          children: [
            _topHeader(),
          // _topHeader(),

              //  getListView(),




          ],
        ),

    ),

    );

  }


  Widget getListView(){

    var listView =ListView(
      children: <Widget>[

        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("Landscape"),
          subtitle: Text("Beautiful View !"),
          trailing: Icon(Icons.wb_sunny),
        ),

        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("Landscape"),
          subtitle: Text("Beautiful View !"),
          trailing: Icon(Icons.wb_sunny),
        ),


      ],




    );

  }

  Widget _topHeader()  {
    return Column(
      children: <Widget>[
        HeaderWidget("Business",true),
        Divider(height: 1.0, color: Colors.grey,),
        WebviewWidget(),
        Divider(height: 1.0, color: Colors.grey,),
        HeaderWidget("OverView",true),
        Divider(height: 1.0, color: Colors.grey,),
        WebviewWidget(),
        Divider(height: 1.0, color: Colors.grey,),
        HeaderWidget("Basic Information",true),






      ],
    );
  }
}
