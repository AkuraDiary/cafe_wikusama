import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/Assets_For_Icon/my_flutter_app_icons.dart';
import '../model.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  _TableListState createState() => _TableListState();
}

class _TableListState extends State<TableList> {
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
    super.initState();
    setState(() {
      _foundedUsers = _users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return addTable();
                  });
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 26,
            ),
            label: Text(''),
          )
        ],
        backgroundColor: Colors.white,
        title: Container(
          height: 38,
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "Table List",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
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
                    child: tableCard(user: _foundedUsers[index]),
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        caption: 'Edit',
                        color: Colors.white,
                        icon: Icons.edit,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return editTable();
                              });
                        },
                      ),
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

  tableCard({required ModelTable user}) {
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
