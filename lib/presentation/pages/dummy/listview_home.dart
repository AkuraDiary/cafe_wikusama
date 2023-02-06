// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'model.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<User> _foundedUsers = [];
//
//   List<User> _users = [
//     User(
//         'Elliana Palacios',
//         '@elliana',
//         false),
//     User(
//         'Kayley Dwyer',
//         '@kayley',
//         false),
//     User(
//         'Kathleen Mcdonough',
//         '@kathleen',
//         false),
//     User(
//         'Kathleen Dyer',
//         '@kathleen',
//         false),
//     User(
//         'Mikayla Marquez',
//         '@mikayla',
//         false),
//     User(
//         'Kiersten Lange',
//         '@kiersten',
//         false),
//     User(
//         'Carys Metz',
//         '@metz',
//         false),
//     User(
//         'Ignacio Schmidt',
//         '@schmidt',
//         false),
//     User(
//         'Clyde Lucas',
//         '@clyde',
//         false),
//     User(
//         'Mikayla Marquez',
//         '@mikayla',
//         false)
//   ];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     setState(() {
//       _foundedUsers = _users;
//     });
//   }
//
//   onSearch(String search) {
//     setState(() {
//       _foundedUsers = _users
//           .where((user) => user.name.toLowerCase().contains(search))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey.shade900,
//         title: Container(
//           height: 38,
//           child: TextField(
//             onChanged: (value) => onSearch(value),
//             decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey[850],
//                 contentPadding: EdgeInsets.all(0),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: Colors.grey.shade500,
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide.none),
//                 hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
//                 hintText: "Search users"),
//           ),
//         ),
//       ),
//       body: Container(
//         color: Colors.grey.shade900,
//         child: _foundedUsers.length > 0
//             ? ListView.builder(
//             itemCount: _foundedUsers.length,
//             itemBuilder: (context, index) {
//               return Slidable(
//                 actionPane: SlidableDrawerActionPane(),
//                 actionExtentRatio: 0.25,
//                 child: userComponent(user: _foundedUsers[index]),
//                 actions: <Widget>[
//                   new IconSlideAction(
//                     caption: 'Archive',
//                     color: Colors.transparent,
//                     icon: Icons.archive,
//                     onTap: () => print("archive"),
//                   ),
//                   new IconSlideAction(
//                     caption: 'Share',
//                     color: Colors.transparent,
//                     icon: Icons.share,
//                     onTap: () => print('Share'),
//                   ),
//                 ],
//                 secondaryActions: <Widget>[
//                   new IconSlideAction(
//                     caption: 'More',
//                     color: Colors.transparent,
//                     icon: Icons.more_horiz,
//                     onTap: () => print('More'),
//                   ),
//                   new IconSlideAction(
//                     caption: 'Delete',
//                     color: Colors.transparent,
//                     icon: Icons.delete,
//                     onTap: () => print('Delete'),
//                   ),
//                 ],
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
//
//   userComponent({required User user}) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       padding: EdgeInsets.only(top: 10, bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(children: [
//             Container(
//                 width: 60,
//                 height: 60,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: Image.network(user.image),
//                 )),
//             SizedBox(width: 10),
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(user.name,
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w500)),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(user.username, style: TextStyle(color: Colors.grey[500])),
//             ])
//           ]),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 user.isFollowedByMe = !user.isFollowedByMe;
//               });
//             },
//             child: AnimatedContainer(
//                 height: 35,
//                 width: 110,
//                 duration: Duration(milliseconds: 300),
//                 decoration: BoxDecoration(
//                     color: user.isFollowedByMe
//                         ? Colors.blue[700]
//                         : Color(0xffffff),
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(
//                       color: user.isFollowedByMe
//                           ? Colors.transparent
//                           : Colors.grey.shade700,
//                     )),
//                 child: Center(
//                     child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow',
//                         style: TextStyle(
//                             color: user.isFollowedByMe
//                                 ? Colors.white
//                                 : Colors.white)))),
//           )
//         ],
//       ),
//     );
//   }
// }
