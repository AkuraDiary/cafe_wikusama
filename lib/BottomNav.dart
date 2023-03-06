import 'package:flutter/material.dart';
import 'presentation/pages/Kasir/home.dart';
import 'presentation/pages/Kasir/listview_home.dart';
import 'presentation/pages/Kasir/listview_home2.dart';
import 'presentation/pages/Manager/Statistict food.dart';
import 'presentation/pages/Kasir/checkout.dart';
import 'presentation/pages/Admin/Food_List.dart';
import 'presentation/pages/Admin/Table_List.dart';
import 'presentation/pages/Admin/User_List.dart';

class KasirBottomNav extends StatefulWidget {
  const KasirBottomNav({super.key});

  @override
  State<KasirBottomNav> createState() => _KasirBottomNavState();
}

class _KasirBottomNavState extends State<KasirBottomNav> {
  int currentIndex = 0;
  final screens = [
    const Checkout(),
    const ListHomePage(),
    const ListHomePage2()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black12,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            currentIndex: currentIndex,
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Pelanggan',
                //backgroundColor: Colors.red
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Pengaturan',
                //backgroundColor: Colors.green
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminBottomNav extends StatefulWidget {
  const AdminBottomNav({Key? key}) : super(key: key);

  @override
  State<AdminBottomNav> createState() => _AdminBottomNavState();
}

class _AdminBottomNavState extends State<AdminBottomNav> {
  int currentIndex = 0;
  final screens = [
    const TableList(),
    const FoodList(),
    const HomePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black12,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            currentIndex: currentIndex,
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
                //backgroundColor: Colors.red
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
                //backgroundColor: Colors.green
              ),
            ],
          ),
        ),
      ),
    );
  }
}
