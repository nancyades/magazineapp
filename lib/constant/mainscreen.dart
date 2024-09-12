import 'package:aanma_nalam/View/homescreen.dart';
import 'package:aanma_nalam/View/leaderboard.dart';
import 'package:aanma_nalam/View/notification.dart';
import 'package:aanma_nalam/View/setting.dart';
import 'package:aanma_nalam/constant/customnavbar.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens corresponding to each tab
  final List<Widget> _screens = [
    HomeScreen(),
    LeaderBoard(),
    NotificationScreen(), // You can change this to the correct page
    Setting(),
  ];

  void _onItemTapped(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Show the selected screen

      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped, // Update selected index on tap
      ),
    );
  }
}
