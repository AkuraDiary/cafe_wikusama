import 'package:flutter/material.dart';
import 'presentation/pages/dummy/home.dart';
import 'presentation/pages/dummy/listview_home.dart';
import 'presentation/pages/dummy/listview_home2.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        
        child: BottomNavigationBar(
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black12,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
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
              label: 'Profile',
              //backgroundColor: Colors.red
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              //backgroundColor: Colors.green
            ),
          ],
        ),
      ),
    );
  }
}
