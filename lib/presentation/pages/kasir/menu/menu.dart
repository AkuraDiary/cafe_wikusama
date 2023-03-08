import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/Assets_For_Icon/my_flutter_app_icons.dart';
import '../../../../data/models/menu_model.dart';
import '../Model.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

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

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => (user.namaMenu ?? " ").toLowerCase().contains(search)).cast<User>()
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
                MyFlutterApp.sliders_h,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                print("Test");
              },
            )
          ],
          backgroundColor: Colors.white,
          title: Container(
            height: 38,
            margin: EdgeInsets.only(top: 10),
            child: TextField(
              onChanged: (value) => onSearch(value),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                  hintText: "Customers cari apa?"),
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
                      child: menuCard(user: _foundedUsers[index]),
                    );
                  })
              : Center(
                  child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.black),
                )),
        ),
        floatingActionButton: Positioned(
          height: 80,
          bottom: 80,
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10, 
            ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
            width: sizedevice - 30,
            height: 80,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' 3 Items | Rp. 180.000,00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
                Text(
                  ' View Orders',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }

  menuCard({required User user}) {
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
                    child: Text(user.addItem ? 'Added' : 'Add',
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