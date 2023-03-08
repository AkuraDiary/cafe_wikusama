import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/Assets_For_Icon/my_flutter_app_icons.dart';
import 'package:cafe_wikusama/presentation/pages/Admin/model.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<UserAuthModel> _UserAuthModel = [
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
    UserAuthModel(
        email: 'tes@gmail.com',
        idUser: 1,
        message: 'tes',
        role: 'Kasir',
        success: true,
        token:'A',
        username: 'AA'
    ),
  ];

  List<ModelUser> _foundedUsers = [];

  bool _isObsecure = true;

  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUsers = _UserAuthModel.cast<ModelUser>();
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
            "User List",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        //---->>>>> Add User here
        actions: [
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      alignment: Alignment.center,
                      title: Text(
                        'Add User',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                fixedSize: const Size(100, 100),
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {},
                              child: const Text('+',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                  ))),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Username',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            obscureText: _isObsecure,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObsecure = !_isObsecure;
                                  });
                                },
                                icon: _isObsecure
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Role :',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              DropdownButton(
                                value: dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                              ),
                              child: Text('Submit'),
                              onPressed: () {},
                            )),
                          )
                        ],
                      ),
                    );
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
                    child: userCard(user: _foundedUsers[index]),
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        caption: 'Edit',
                        color: Colors.white,
                        icon: Icons.edit,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  alignment: Alignment.center,
                                  title: Text(
                                    'Add User',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amber,
                                            fixedSize: const Size(100, 100),
                                            shape: const CircleBorder(),
                                          ),
                                          onPressed: () {},
                                          child: const Text('',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 32,
                                              ))),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Username',
                                          enabled: true,
                                          contentPadding: const EdgeInsets.only(
                                              left: 14.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                new BorderRadius.circular(10),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                new BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        obscureText: _isObsecure,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Password',
                                          enabled: true,
                                          contentPadding: const EdgeInsets.only(
                                              left: 14.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                new BorderRadius.circular(10),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                new BorderRadius.circular(10),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _isObsecure = !_isObsecure;
                                              });
                                            },
                                            icon: _isObsecure
                                                ? const Icon(Icons.visibility)
                                                : const Icon(
                                                    Icons.visibility_off),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Text(
                                              'Role :',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          DropdownButton(
                                            value: dropdownvalue,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: items.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                items = items;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.amber),
                                          ),
                                          child: Text('Submit'),
                                          onPressed: () {},
                                        )),
                                      )
                                    ],
                                  ),
                                );
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

  userCard({required ModelUser user}) {
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
                  onPressed: () {
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
                    child: Text(user.role),
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
