import 'package:flutter/material.dart';



import 'package:raspberrypistreamer/navbar/bottom_navbar_pages/bottom_nav_deposit_page.dart';
import 'package:raspberrypistreamer/navbar/bottom_navbar_pages/bottom_nav_home_page.dart';
import 'package:raspberrypistreamer/navbar/bottom_navbar_pages/bottom_nav_search_page.dart';
import 'package:raspberrypistreamer/navbar/top_navbar/top_navbar_pages/top_nav_settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex = 0;
  final bottomNavBarPages = [
    const BottomNavHomePage(),
    const BottomNavSearchPage(),
    const BottomNavDepositPage(),
  ];

  void _updateIndex(int value) {
    setState(() {
      bottomNavBarIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TopNavSettingsPage()));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: bottomNavBarPages[bottomNavBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavBarIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),

          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Deposit",
            icon: Icon(Icons.grid_view),
          ),
        ],
      ),
    );
  }
}
