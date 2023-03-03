import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/widgets/my_flutter_app_icons.dart';
import 'package:cafe_wikusama/presentation/pages/Admin/Model.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<ModelUser> _ModelUser = [
    ModelUser(
        'Elliana Palacios',
        '@elliana',
        'Kasir'
    ),
    ModelUser(
        'Kayley Dwyer',
        '@kayley',
        'Manager'
    ),
    ModelUser(
        'Kathleen Mcdonough',
        '@kathleen',
        'Admin',
    ),
    ModelUser(
        'Kathleen Dyer',
        '@kathleen',
        'Admin',
    ),
    ModelUser(
        'Mikayla Marquez',
        '@mikayla',
        'Manager',
   ),
    ModelUser(
        'Kiersten Lange',
        '@kiersten',
        'Kasir',
    ),
    ModelUser(
        'Carys Metz',
        '@metz',
        'Admin',
    ),
    ModelUser(
        'Ignacio Schmidt',
        '@schmidt',
        'Admin',
        ),
    ModelUser(
        'Clyde Lucas',
        '@clyde',
        'Manager',
        ),
    ModelUser(
        'Mikayla Marquez',
        '@mikayla',
        'Kasir',
        )
  ];

  List<ModelUser> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _ModelUser;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _ModelUser
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizedevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 38,
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "User List",
            style: TextStyle(color: Colors.black,fontSize: 30),
          ),
        ),
        actions: [
          IconButton(
            icon : Icon(
              Icons.add,
              size: 30,
              color: Colors.black,
            ),
            onPressed: (){
              print("Test");
            },
          )
        ],
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

  userComponent({required ModelUser user}) {
    final sizedevicewidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 110,
                height: 110,
                child: IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.orange,
                    size: 100,
                  ),
                  onPressed: (){
                    print("Test");
                  },
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              SizedBox(
                height: 5,
              ),
              Text("Password :" + user.password,
                  style: TextStyle(color: Colors.black, fontSize: 12)),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "Role : ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: Text(
                        user.role
                    ),
                  )
                ],
              ),
            ])
          ]),

        ],
      ),
    );
  }
}