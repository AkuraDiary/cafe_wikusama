// import 'package:cafe_wikusama/presentation/widgets/my_flutter_app_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:cafe_wikusama/presentation/pages/dummy/model_list.dart';

// class ListStatisticFood extends StatefulWidget {
//   const ListStatisticFood({Key? key}) : super(key: key);

//   @override
//   _ListStatisticFood createState() => _ListStatisticFood();
// }

// class _ListStatisticFood extends State<ListStatisticFood> {

//   List<User> _foundedUsers = [];
//   List<User> _foundedMenu = [];
//   List<User> _users = [
//     User(
//         '01',
//         'Elliana Palacios',
//         '@elliana',
//         'Rp 270000',
//         false),
//     User(
//         '02',
//         'Kayley Dwyer',
//         '@kayley',
//         'Rp 270000',
//         false),
//     User(
//         '03',
//         'Kathleen Mcdonough',
//         '@kathleen',
//         'Rp 270000',
//         false),
//     User(
//         '04',
//         'Kathleen Dyer',
//         '@kathleen',
//         'Rp 270000',
//         false),
//     User(
//         '05',
//         'Mikayla Marquez',
//         '@mikayla',
//         'Rp 270000',
//         false),
//     User(
//         '06',
//         'Kiersten Lange',
//         '@kiersten',
//         'Rp 270000',
//         false),
//     User(
//         '07',
//         'Carys Metz',
//         '@metz',
//         'Rp 270000',
//         false),
//     User(
//         '08',
//         'Ignacio Schmidt',
//         '@schmidt',
//         'Rp 270000',
//         false),
//     User(
//         '09',
//         'Clyde Lucas',
//         '@clyde',
//         'Rp 270000',
//         false),
//     User(
//         '10',
//         'Mikayla Marquez',
//         '@mikayla',
//         'Rp 270000',
//         false)
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     setState(() {
//       _foundedUsers = _users;
//       _foundedMenu = _users;
//     });
//   }


//   onSearch(String search) {
//     setState(() {
//       _foundedUsers = _users
//           .where((user) => user.name.toLowerCase().contains(search))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(
//               MyFlutterApp.sliders_h,
//               color: Colors.black,
//               size: 25,
//             ),
//             onPressed: (){
//               print("Test");
//             },
//           )
//         ],
//         backgroundColor: Colors.white,
//         title: Container(
//           height: 30,
//           margin: EdgeInsets.only(top: 10),
//           child: TextField(
//             onChanged: (value) => onSearch(value),
//             decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey.shade200,
//                 contentPadding: EdgeInsets.all(0),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: Colors.black,
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide.none),
//                 hintStyle: TextStyle(fontSize: 14, color: Colors.black),
//                 hintText: "Search"),
//           ),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Container(

//         ),
//         children: _foundedUsers.length > 0
//             ? ListView.builder(
//             itemCount: _foundedUsers.length,
//             itemBuilder: (context, index) {
//               return Slidable(
//                 actionPane: SlidableDrawerActionPane(),
//                 actionExtentRatio: 0.25,
//                 child: userComponent(user: _foundedUsers[index]),
//                 //   actions: <Widget>[
//                 //     new IconSlideAction(
//                 //       caption: 'Archive',
//                 //       color: Colors.transparent,
//                 //       icon: Icons.archive,
//                 //       onTap: () => print("archive"),
//                 //     ),
//                 //     new IconSlideAction(
//                 //       caption: 'Share',
//                 //       color: Colors.transparent,
//                 //       icon: Icons.share,
//                 //       onTap: () => print('Share'),
//                 //     ),
//                 //   ],
//                 //   secondaryActions: <Widget>[
//                 //     new IconSlideAction(
//                 //       caption: 'More',
//                 //       color: Colors.transparent,
//                 //       icon: Icons.more_horiz,
//                 //       onTap: () => print('More'),
//                 //     ),
//                 //     new IconSlideAction(
//                 //       caption: 'Delete',
//                 //       color: Colors.transparent,
//                 //       icon: Icons.delete,
//                 //       onTap: () => print('Delete'),
//                 //     ),
//                 //   ],
//               );
//             })
//             : Center(
//             child: Text(
//               "No users found",
//               style: TextStyle(color: Colors.white),
//             )),
//       ),
//     );
//   }

//   userComponent({required User user}) {
//     Container(

//       child: Column(
//         children: [
//           Container(
//             height: 400,
//             padding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 35
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: const[
//                 Center(
//                   child: Text("Total Pesanan",
//                   style: TextStyle(
//                     color: Colors.black,fontSize: 50
//                   ),),

//                 )
//               ],

//             ),
//           )
//         ],

//       ),
//     );
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
//       padding: EdgeInsets.only(top: 10, bottom: 10,left: 20,right: 20),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black,width: 1),
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.transparent,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(user.no,
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                       color: Colors.black,fontWeight: FontWeight.w500, fontSize: 14
//                   ) ,),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(user.username,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500
//                   ),),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(user.username,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14
//                   ),),
//                 Text(user.username,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14
//                   ),),
//                 Text(user.username,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14
//                   ),),
//                 SizedBox(
//                   height: 10,
//                 )
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(user.price,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500
//                   ),),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Text(
//                   "User, Date",
//                   style: TextStyle(
//                       fontSize: 12, fontWeight: FontWeight.w200
//                   ),

//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
