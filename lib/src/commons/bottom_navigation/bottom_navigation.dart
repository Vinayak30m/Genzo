import 'package:flutter/material.dart';
import 'package:genzo/src/features/cart/cart_screen.dart';
import 'package:genzo/src/features/home/homescreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    CartScreen(),
    // FeedsScreen(),
    // ChooseAccountScreen(),
    // ProfileScreen(),
    // SplashScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 25, // Adjust icon size if needed
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            activeIcon: _buildActiveIcon(
                Icons.home_rounded), // Use rounded icon for selected state
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Schedule',
            activeIcon: _buildActiveIcon(Icons.calendar_today_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Post',
            activeIcon: _buildActiveIcon(Icons
                .add_box_outlined), // Assuming you have a rounded insights icon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            label: 'Insights',
            activeIcon: _buildActiveIcon(Icons.insights_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            activeIcon: _buildActiveIcon(Icons.account_circle_rounded),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveIcon(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, color: Colors.white),
    );
  }
}
