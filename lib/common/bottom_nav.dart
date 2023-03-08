
import 'package:cafe_wikusama/presentation/pages/admin/food_list/food_list.dart';
import 'package:cafe_wikusama/presentation/pages/admin/table_list/table_list.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/Kasir/Menu/menu.dart';
import '../presentation/pages/Kasir/Pesan/pesanan.dart';
import '../presentation/pages/Kasir/Riwayat/history_pesanan.dart';
import '../presentation/pages/Kasir/Checkout/checkout.dart';

class KasirBottomNav extends StatefulWidget {
  const KasirBottomNav({super.key});

  @override
  State<KasirBottomNav> createState() => _KasirBottomNavState();
}

class _KasirBottomNavState extends State<KasirBottomNav> {
  int currentIndex = 0;
  final screens = [
    const Checkout(),
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
