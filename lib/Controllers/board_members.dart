import 'package:flutter/material.dart';
import 'package:ir_app/Models/member_item.dart';
import 'package:ir_app/Widgets/member_widget.dart';

class BoardMembersListWidget extends StatefulWidget {
  BoardMembersListWidget({Key key}) : super(key: key);

  @override
  _BoardMembersListWidgetState createState() => _BoardMembersListWidgetState();
}

class _BoardMembersListWidgetState extends State<BoardMembersListWidget> {
  List<Member> boardMemberItems = [
    Member('Hesham Abulmalik Al-Alsheikh', 'Chairman of the Board',
        'profileImageString'),
    Member('Hesham Abulmalik Al-Alsheikh', 'Chairman of the Board',
        'profileImageString'),
    Member('Hesham Abulmalik Al-Alsheikh', 'Chairman of the Board',
        'profileImageString'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.builder(
        itemCount: boardMemberItems.length,
        itemBuilder: (context, index) {
          var item = boardMemberItems[index];
          return MemberWidget(memberItem: item);
        },
      ),
    );
  }
}
