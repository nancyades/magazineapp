import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final Function(int)? onTap;
  int? selectedIndex;


  CustomNavigationBar({this.onTap, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      child: BottomBarBubble(
        backgroundColor: AppTheme.articlebgcolor,
       color: AppTheme.corecolor,
        items: [
          BottomBarItem(
            iconBuilder: (isSelected) => ImageIcon(
              AssetImage('assets/images/icons/home.png',),
              color:  selectedIndex == 0 ? AppTheme.corecolor : Colors.grey, // Adjust colors as needed
              size: 30, // Adjust size as needed
            ),
          ),
          BottomBarItem(
            iconBuilder: (isSelected) => ImageIcon(
              AssetImage('assets/images/icons/Membership Icon.png',),
              color:  selectedIndex == 1  ? AppTheme.corecolor : Colors.grey,
              size: 30,
            ),
          ),
          BottomBarItem(
            iconBuilder: (isSelected) => ImageIcon(
              AssetImage('assets/images/icons/Notification Icon.png',),
              color:  selectedIndex == 2  ? AppTheme.corecolor : Colors.grey,
              size: 25,
            ),
          ),
          BottomBarItem(
            iconBuilder: (isSelected) => ImageIcon(
              AssetImage('assets/images/icons/More.png',),
              color: selectedIndex == 3 ? AppTheme.corecolor : Colors.grey,
              size: 25,
            ),
          ),
        ],
        onSelect: onTap,
        selectedIndex: selectedIndex!,
      ),
    );

  }
}






