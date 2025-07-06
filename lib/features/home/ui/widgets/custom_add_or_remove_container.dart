import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddOrRemoveContainer extends StatelessWidget {
  const CustomAddOrRemoveContainer({
    super.key,
    required this.backgroundColor,
    this.onTap,
    this.icon,
    required this.iconColor,
  });
  final Color backgroundColor;
  final void Function()? onTap;
  final IconData? icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
