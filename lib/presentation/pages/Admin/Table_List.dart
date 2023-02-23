import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/widgets/my_flutter_app_icons.dart';
import 'Model.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  List<ModelTable> _users = [
    ModelTable(
      'Table 1',
    ),
    ModelTable(
      'Table 2',
    ),
    ModelTable(
      'Table 3',
    ),
    ModelTable(
      'Table 4',
    ),
    ModelTable(
      'Table 5',
    ),
    ModelTable(
      'Table 6',
    ),
    ModelTable(
      'Table 7',
    ),
    ModelTable(
      'Table 8',
    ),
    ModelTable(
      'Table 9',
    ),
    ModelTable(
      'Table 10',
    ),
  ];

  List<ModelTable> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizedevice = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                print("Test");
              },
            )
          ],
          backgroundColor: Colors.transparent,
          title: Container(
            height: 38,
            margin: EdgeInsets.only(top: 10),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: _foundedUsers.length > 0
              ? ListView.builder(
                  itemCount: _foundedUsers.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: userComponent(user: _foundedUsers[index]),
                      actions: <Widget>[
                        /*new IconSlideAction(
                        caption: 'Archive',
                        color: Colors.transparent,
                        icon: Icons.archive,
                        onTap: () => print("archive"),
                      ),
                      new IconSlideAction(
                        caption: 'Share',
                        color: Colors.transparent,
                        icon: Icons.share,
                        onTap: () => print('Share'),
                      ),*/
                      ],
                      secondaryActions: <Widget>[
                        /*new IconSlideAction(
                        caption: 'More',
                        color: Colors.transparent,
                        icon: Icons.more_horiz,
                        onTap: () => print('More'),
                      ),
                      new IconSlideAction(
                        caption: 'Delete',
                        color: Colors.transparent,
                        icon: Icons.delete,
                        onTap: () => print('Delete'),
                      ),*/
                      ],
                    );
                  })
              : Center(
                  child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.black),
                )),
        ),
      );
  }

  userComponent({required ModelTable user}) {
    final sizedevicewidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Container(
        height: 75,
        child: Center(
          child: Text(
            user.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      )
    );
  }
}