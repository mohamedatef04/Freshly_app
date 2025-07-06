import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void showCustomToast(
  BuildContext context, {
  required String message,
  required Color color,
  required titleText,
  required AnimatedSnackBarType type,
}) {
  AnimatedSnackBar.material(
    '$message',
    animationCurve: Curves.fastEaseInToSlowEaseOut,
    type: type,
    duration: const Duration(seconds: 2),
  ).show(context);
}
