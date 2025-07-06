import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';

void showSnakBar(
  BuildContext context, {
  required String message,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(
        message,
        style: AppStyles.white16.copyWith(fontSize: 14.sp),
      ),
      backgroundColor: color,
    ),
  );
}
