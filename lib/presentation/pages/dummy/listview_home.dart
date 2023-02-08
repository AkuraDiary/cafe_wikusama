import 'package:cafe_wikusama/presentation/widgets/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'model_list.dart';

class ListHomePage extends StatefulWidget {
  const ListHomePage({Key? key}) : super(key: key);

  @override
  _ListHomePageState createState() => _ListHomePageState();
}

class _ListHomePageState extends State<ListHomePage> {
  List<User> _foundedUsers = [];

  List<User> _users = [
    User(
        'Elliana Palacios',
        '@elliana',
        false),
    User(
        'Kayley Dwyer',
        '@kayley',
        false),
    User(
        'Kathleen Mcdonough',
        '@kathleen',
        false),
    User(
        'Kathleen Dyer',
        '@kathleen',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        false),
    User(
        'Kiersten Lange',
        '@kiersten',
        false),
    User(
        'Carys Metz',
        '@metz',
        false),
    User(
        'Ignacio Schmidt',
        '@schmidt',
        false),
    User(
        'Clyde Lucas',
        '@clyde',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        false)
  ];

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 38,
          child: Text(
            "Pesanan",
              style: TextStyle(color: Colors.black,fontSize: 30),
        ),
      ),
        actions: [
          IconButton(
            icon: Icon(
              MyFlutterApp.sliders_h,
              color: Colors.black,
              size: 25,
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
              //   actions: <Widget>[
              //     new IconSlideAction(
              //       caption: 'Archive',
              //       color: Colors.transparent,
              //       icon: Icons.archive,
              //       onTap: () => print("archive"),
              //     ),
              //     new IconSlideAction(
              //       caption: 'Share',
              //       color: Colors.transparent,
              //       icon: Icons.share,
              //       onTap: () => print('Share'),
              //     ),
              //   ],
              //   secondaryActions: <Widget>[
              //     new IconSlideAction(
              //       caption: 'More',
              //       color: Colors.transparent,
              //       icon: Icons.more_horiz,
              //       onTap: () => print('More'),
              //     ),
              //     new IconSlideAction(
              //       caption: 'Delete',
              //       color: Colors.transparent,
              //       icon: Icons.delete,
              //       onTap: () => print('Delete'),
              //     ),
              //   ],
               );
            })
            : Center(
            child: Text(
              "No users found",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.only(top: 10, bottom: 10,left: 20,right: 20),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.transparent,
    ),
      child: Row(
        children: [
          Column(
            children: [

            ],
          ),
          Column(
            children: [

            ],
          )
        ],

      ),
    );
  }
}
