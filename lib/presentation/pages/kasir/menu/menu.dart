import 'package:cafe_wikusama/common/app_shared_preferences.dart';
import 'package:cafe_wikusama/dependecy_injection.dart';
import 'package:cafe_wikusama/presentation/notifier/menu/menu_notifier.dart';
import 'package:cafe_wikusama/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/Assets_For_Icon/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/menu_model.dart';
import '../Model.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  allMenu() async {
    Future.microtask(
        () => Provider.of<MenuNotifier>(context, listen: false)..menu());
  }

  @override
  void initState() {
    super.initState();
    allMenu();
    // setState(() {});
  }

  // onSearch(String search) {
  //   setState(() {
  //     _foundedUsers = _users
  //         .where((user) => (user.namaMenu ?? " ").toLowerCase().contains(search)).cast<User>()
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final sizedevice = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 38,
          child: Text(
            "Menu",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              locator.get<AppSharedPreferences>().removeToken(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginScreen())));
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Consumer<MenuNotifier>(builder: (context, provider, child) {
          return provider.menuResult.length > 0
              ? ListView.builder(
                  itemCount: provider.menuResult.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Flexible(
                          child:
                              menuCard(menuModel: provider.menuResult[index]!)),
                      secondaryActions: <Widget>[
                        new IconSlideAction(
                          caption: 'Add',
                          color: Colors.white,
                          icon: Icons.edit,
                          onTap: () {
                            provider.menuResult[index]!.harga =
                                provider.menuResult[index]!.harga! + 1;
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return editTable();
                            //     });
                          },
                        ),
                      ],
                    );
                  })
              : Center(
                  child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.black),
                ));
        }),
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
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              TextButton(
                onPressed: () {},
                child: Text("View Order"),
              )
            ],
          ),
        ),
      ),
    );
  }

  menuCard({required MenuModel menuModel}) {
    return Flexible(
      child: Container(
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
                    child: Image.network(menuModel.path!),
                  )),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(menuModel.namaMenu ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                SizedBox(
                  height: 5,
                ),
                Container(
                    width: 100,
                    height: 30,
                    child: Text(menuModel.deskripsi ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 12))),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Rp : " + menuModel.harga.toString() ?? "",
                  style: TextStyle(color: Colors.amber),
                ),
              ])
            ]),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       // user.addItem = !user.addItem;
            //     });
            //   },
            //   child: AnimatedContainer(
            //       height: 35,
            //       width: 70,
            //       duration: Duration(milliseconds: 300),
            //       decoration: BoxDecoration(
            //           color:
            //               user.addItem ? Colors.transparent : Colors.transparent,
            //           borderRadius: BorderRadius.circular(5),
            //           border: Border.all(
            //             color: user.addItem
            //                 ? Colors.transparent
            //                 : Colors.transparent,
            //           )),
            //       child: Center(
            //           child: Text(user.addItem ? 'Added' : 'Add',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 16,
            //                   color:
            //                       user.addItem ? Colors.black : Colors.black)))),
            // )
          ],
        ),
      ),
    );
  }
}
