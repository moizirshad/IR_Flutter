
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class HeaderWidget extends StatelessWidget{

  HeaderWidget(this.title,this.isHeader);

  final String title;
  final bool isHeader;

        @override
        Widget build(BuildContext context) {

        if(isHeader){

        return  Container(
        decoration: BoxDecoration(color: Colors.green[50]),
        height: 40.0,
        alignment:Alignment.centerLeft,
        child: Text(title, style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold, decoration: TextDecoration.none),),
        );

        }else{

        return  Container(
        decoration: BoxDecoration(color: Colors.white70),
        height: 40.0,
        alignment:Alignment.centerLeft,
        child: Text(title, style: TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.normal, decoration: TextDecoration.none),),
        );

        }

        }



}