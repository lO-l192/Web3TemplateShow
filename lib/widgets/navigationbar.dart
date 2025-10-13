import 'package:aspirehub/screens/dash_board_screen.dart';
import 'package:flutter/material.dart';

class MyBasicNav extends StatefulWidget {
  const MyBasicNav({super.key});

  @override
  State<MyBasicNav> createState() => _MyBasicNavState();
}

class _MyBasicNavState extends State<MyBasicNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [DashBoardScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF221763),
        unselectedItemColor: Color(0xFFA6A6A6),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Courses',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
