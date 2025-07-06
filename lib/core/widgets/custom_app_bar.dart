import 'package:flutter/material.dart';
import 'package:freshly_app/core/theme/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.icon});
  final String title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: icon,
      title: Text(title, style: AppStyles.black24),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
