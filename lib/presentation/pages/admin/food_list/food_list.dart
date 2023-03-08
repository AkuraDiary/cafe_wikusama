import 'package:cafe_wikusama/data/models/menu_model.dart';
import 'package:cafe_wikusama/presentation/pages/admin/food_list/widget/edit_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/Assets_For_Icon/my_flutter_app_icons.dart';
import 'package:cafe_wikusama/presentation/pages/Admin/food_list/widget/add_button.dart';
import 'package:cafe_wikusama/presentation/pages/Kasir/Model.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<MenuModel> _users = [
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 10000,
        idMenu: 1,
        jenis:'Makanan',
        namaMenu: 'A'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 20000,
        idMenu: 2,
        jenis:'Makanan',
        namaMenu: 'B'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 30000,
        idMenu: 3,
        jenis:'Makanan',
        namaMenu: 'C'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 40000,
        idMenu: 4,
        jenis:'Makanan',
        namaMenu: 'D'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 50000,
        idMenu: 5,
        jenis:'Makanan',
        namaMenu: 'E'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 60000,
        idMenu: 6,
        jenis:'Makanan',
        namaMenu: 'F'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 70000,
        idMenu: 7,
        jenis:'Makanan',
        namaMenu: 'G'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 80000,
        idMenu: 8,
        jenis:'Makanan',
        namaMenu: 'H'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 90000,
        idMenu: 9,
        jenis:'Makanan',
        namaMenu: 'I'),
    MenuModel(
        deskripsi: 'Menu',
        filename: 'FileMenu',
        harga: 100000,
        idMenu: 10,
        jenis:'Makanan',
        namaMenu: 'J'),
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUsers = _users.cast<User>();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        actions: [
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return addFood();
                    //show create new menu
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
                    child: foodCard(user: _foundedUsers[index]),
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

  foodCard({required User user}) {
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
          TextButton(
            child: Text(
              'Edit',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return editFood();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
