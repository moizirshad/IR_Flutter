import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_app/Models/BoardMembers.dart';



class ListTileWidgett extends StatelessWidget {

  List<Data> data;
  int index;


  ListTileWidgett(this.data,this.index);


  @override
  Widget build(BuildContext context) {

   return ListTileWidget(data,index);

  }
}


Widget ListTileWidget(List<Data> data, int index) {

  return ListTile(
      leading:CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(data[index].ProfilePicURL!),
        backgroundColor: Colors.transparent,
      ),title: Text(data[index].NameEn!),subtitle: Text(data[index].PositionNameEn!));

}

