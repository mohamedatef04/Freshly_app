import 'package:flutter/material.dart';
import 'package:freshly_app/core/theme/app_styles.dart';

class CustomRowTitle extends StatelessWidget {
  const CustomRowTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(title, style: AppStyles.black20)],
    );
  }
}
