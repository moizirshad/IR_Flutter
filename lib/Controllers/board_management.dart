import 'package:flutter/material.dart';
import 'package:ir_app/Controllers/ratios.dart';
import 'package:ir_app/Network/api_paths.dart';
import 'package:ir_app/Utils/CircularProgressBar.dart';
import 'package:ir_app/saeed_classes/BoardMembersEnt.dart';
import 'package:ir_app/saeed_classes/ServiceHelper.dart';
import 'board_members.dart';

class BoardManagementWidget extends StatefulWidget {
  @override
  _BoardManagementWidgetState createState() => _BoardManagementWidgetState();
}

class _BoardManagementWidgetState extends State<BoardManagementWidget> {
  @override
  void initState() {
    super.initState();

    print('init board managment');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.teal[900],
          appBar: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  "Board Members",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Executives",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              MembersApiCall("boardmember"),
              // MembersApiCall("exec"),
              // BoardMembersListWidget("boardmember"),
              BoardMembersListWidget("exec", key: null),
            ],
          ),
        ),
      ),
    );
  }
}

class MembersApiCall extends StatelessWidget{
  String type;

  MembersApiCall(this.type);

  @override
  Widget build(BuildContext context) {

    Map data = {
      ApiUrls.CompanyID: '47',
      ApiUrls.CompanyPositionType: type
    };
    return FutureBuilder(
      future: ServiceHelper.postApiCall(context,getCompanyBoardMembers,data),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var responseApi = BoardMembersEnt().getData(snapshot.data);
          return MembersListView(responseApi);
        } else {
          return CircularProgressBar();
        }
      },
    );
  }
}

class MembersListView extends StatelessWidget {
  List<BoardMembersEnt>? items;

  MembersListView(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: items!.length,
      separatorBuilder: (context, index) {
        return Divider(
          height: 1,
          thickness: 1,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return ListItem(context, items![index]);
      },
    );
  }
}

class ListItem extends StatelessWidget {
  BoardMembersEnt? item;

  ListItem(BuildContext context, BoardMembersEnt item){
    this.item=item;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item!.nameEn.toString()),
      subtitle: Text(item!.companyPositionTypeNameEn.toString()),
      leading: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(item!.profilePicURL.toString()),
        backgroundColor: Colors.transparent,
      ),
    );
  }

}