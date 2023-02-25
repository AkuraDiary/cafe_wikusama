import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cafe_wikusama/presentation/widgets/my_flutter_app_icons.dart';
import 'Model.dart';

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
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      alignment: Alignment.center,
                      title: Text(
                        'Add Table',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23
                        ),
                        textAlign: TextAlign.center,
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Table Name',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                left: 14.0,
                                bottom: 8.0,
                                top: 8.0
                              ),
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
                            height: 45,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                                ),
                                child: Text(
                                   'Submit'
                                ),
                                onPressed: (){

                                },
                              )
                            ),
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
        backgroundColor: Colors.transparent,
        title: Container(
          child: Text(
            'Table List',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
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
                      // new IconSlideAction(
                      //   caption: 'Archive',
                      //   color: Colors.transparent,
                      //   icon: Icons.archive,
                      //   onTap: () => print("archive"),
                      // ),
                      // new IconSlideAction(
                      //   caption: 'Share',
                      //   color: Colors.transparent,
                      //   icon: Icons.share,
                      //   onTap: () => print('Share'),
                      // ),
                    ],
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        caption: 'Edit',
                        color: Colors.white,
                        icon: Icons.edit,
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  alignment: Alignment.center,
                                  title: Text(
                                    'Edit Table',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Table Name',
                                          enabled: true,
                                          contentPadding: const EdgeInsets.only(
                                            left: 14.0,
                                            bottom: 8.0,
                                            top: 8.0
                                          ),
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
                                        height: 45,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Colors.amber),
                                            ),
                                            child: Text(
                                              'Submit'
                                            ),
                                            onPressed: (){

                                            },
                                          )
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                      // new IconSlideAction(
                      //   caption: 'Delete',
                      //   color: Colors.transparent,
                      //   icon: Icons.delete,
                      //   onTap: () => print('Delete'),
                      // ),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
