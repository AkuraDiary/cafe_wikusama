import 'package:flutter/material.dart';

import 'presentation/pages/Kasir/Menu/Menu.dart';
import 'presentation/pages/Kasir/Pesan/Pesanan.dart';
import 'presentation/pages/Kasir/Riwayat/HistoryPesanan.dart';
import 'presentation/pages/Kasir/Checkout/Checkout.dart';

import 'presentation/pages/Admin/FoodList/Food_List.dart';
import 'presentation/pages/Admin/TableList/Table_List.dart';
import 'presentation/pages/Admin/UserList/User_List.dart';

class KasirBottomNav extends StatefulWidget {
  const KasirBottomNav({super.key});

  @override
  State<KasirBottomNav> createState() => _KasirBottomNavState();
}

class _KasirBottomNavState extends State<KasirBottomNav> {
  int currentIndex = 0;
  final screens = [
    const Menu(),
    const Pesanan(),
    const HistoryPesanan(),
    //const Checkout()
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
                icon: Icon(Icons.timelapse_outlined),
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
    const UserList()
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
                icon: Icon(Icons.fastfood),
                label: '',
                //backgroundColor: Colors.red
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
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
