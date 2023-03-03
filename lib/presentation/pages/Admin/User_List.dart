import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/widgets/my_flutter_app_icons.dart';
import 'package:cafe_wikusama/presentation/pages/Kasir/model.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> _ModelUser = [
    User(
        'Elliana Palacios',
        '@elliana',
        'Kasir',
        false),
    User(
        'Kayley Dwyer',
        '@kayley',
        'Manager',
        false),
    User(
        'Kathleen Mcdonough',
        '@kathleen',
        'Admin',
        false),
    User(
        'Kathleen Dyer',
        '@kathleen',
        'Admin',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        'Manager',
        false),
    User(
        'Kiersten Lange',
        '@kiersten',
        'Kasir',
        false),
    User(
        'Carys Metz',
        '@metz',
        'Admin',
         false),
    User(
        'Ignacio Schmidt',
        '@schmidt',
        'Admin',
        false),
    User(
        'Clyde Lucas',
        '@clyde',
        'Manager',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        'Kasir',
        false)
  ];

  List<User> _foundedUsers = [];

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
            "Food List",
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

  userComponent({required User user}) {
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(user.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("PIZZA APA HAYO",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              SizedBox(
                height: 5,
              ),
              Text("Deskripsi Produk",
                  style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              SizedBox(
                height: 25,
              ),
              Text(
                "Rp. ",
                style: TextStyle(color: Colors.amber),
              ),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                user.addItem = !user.addItem;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 70,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color:
                    user.addItem ? Colors.transparent : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: user.addItem
                          ? Colors.transparent
                          : Colors.transparent,
                    )),
                child: Center(
                    child: Text(user.addItem ? 'Edited' : 'Edit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                            user.addItem ? Colors.black : Colors.black)))),
          )
        ],
      ),
    );
  }
}