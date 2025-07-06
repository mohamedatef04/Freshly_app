import 'package:flutter/material.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      tabMargin: const EdgeInsets.all(15),

      // tab button ripple color when pressed
      haptic: true, // haptic feedback
      tabBorderRadius: 15,

      curve: Curves.easeIn, // tab animation curves
      duration: const Duration(milliseconds: 200), // tab animation duration
      gap: 8, // the tab button gap between icon and text
      color: Colors.grey[800], // unselected icon color
      activeColor: AppColors.primaryColor, // selected icon and text color
      iconSize: 20, // tab button icon size
      tabBackgroundColor: const Color.fromARGB(48, 147, 196, 255),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      onTabChange: (value) {}, // navigation bar padding
      tabs: const [
        GButton(icon: Icons.home, text: 'Home'),
        GButton(icon: Icons.favorite, text: 'Favorite'),
        GButton(icon: Icons.person, text: 'Profile'),
      ],
    );
  }
}
