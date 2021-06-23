import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import 'package:ir_app/Models/member_item.dart';

//RowWidget
class MemberWidget extends StatefulWidget {
  MemberWidget({Key key, this.memberItem}) : super(key: key);

  final Member memberItem;

  @override
  _MemberWidgetState createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget> {
  Member memberItem;

  @override
  void initState() {
    super.initState();
    print("object");
    this.memberItem = widget.memberItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
            title: Transform(
                transform: Matrix4.translationValues(-30, 0.0, 0.0),
                child: Text(
                  this.memberItem.nameString,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0),
                )),
            subtitle: Transform(
                transform: Matrix4.translationValues(-30, 0.0, 0.0),
                child: Text(
                  this.memberItem.designationString,
                  style: TextStyle(
                      color: lightGreyTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0),
                )),
            leading: Transform(
                transform: Matrix4.translationValues(-16, 0.0, 0.0),
                child: CircleAvatar(
                  radius: 44.0,
                  backgroundImage:
                      NetworkImage('http://googleflutter.com/sample_image.jpg'),
                ))));
  }
}
