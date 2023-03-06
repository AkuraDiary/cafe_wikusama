import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/Assets_For_Icon/my_flutter_app_icons.dart';
import '../Model.dart';

class HistoryPesanan extends StatefulWidget {
  const HistoryPesanan({Key? key}) : super(key: key);

  @override
  _HistoryPesananState createState() => _HistoryPesananState();
}

class _HistoryPesananState extends State<HistoryPesanan> {

  List<ModelPesanan> _foundedUsers = [];
  List<ModelPesanan> _foundedMenu = [];
  List<ModelPesanan> _users = [
    ModelPesanan(
        '01',
        'Elliana Palacios',
        '@elliana',
        'Rp 270000',
        false),
    ModelPesanan(
        '02',
        'Kayley Dwyer',
        '@kayley',
        'Rp 270000',
        false),
    ModelPesanan(
        '03',
        'Kathleen Mcdonough',
        '@kathleen',
        'Rp 270000',
        false),
    ModelPesanan(
        '04',
        'Kathleen Dyer',
        '@kathleen',
        'Rp 270000',
        false),
    ModelPesanan(
        '05',
        'Mikayla Marquez',
        '@mikayla',
        'Rp 270000',
        false),
    ModelPesanan(
        '06',
        'Kiersten Lange',
        '@kiersten',
        'Rp 270000',
        false),
    ModelPesanan(
        '07',
        'Carys Metz',
        '@metz',
        'Rp 270000',
        false),
    ModelPesanan(
        '08',
        'Ignacio Schmidt',
        '@schmidt',
        'Rp 270000',
        false),
    ModelPesanan(
        '09',
        'Clyde Lucas',
        '@clyde',
        'Rp 270000',
        false),
    ModelPesanan(
        '10',
        'Mikayla Marquez',
        '@mikayla',
        'Rp 270000',
        false)
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedMenu = _users;
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
          //Filter Icon
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
                child: historyCard(user: _foundedUsers[index]),
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

  historyCard({required ModelPesanan user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      padding: EdgeInsets.only(top: 10, bottom: 10,left: 20,right: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 1),
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.no,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.w500, fontSize: 14
                  ) ,),
                SizedBox(
                  height: 10,
                ),
                Text(user.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500
                  ),),
                SizedBox(
                  height: 10,
                ),
                Text(user.username,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14
                  ),),
                Text(user.username,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14
                  ),),
                Text(user.username,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14
                  ),),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.price,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500
                  ),),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "User, Date",
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300
                  ),

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}