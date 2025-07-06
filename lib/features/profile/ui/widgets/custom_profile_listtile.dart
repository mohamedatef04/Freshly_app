import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';

class CustomProfileListtile extends StatelessWidget {
  const CustomProfileListtile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  final Widget leading;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(255, 111, 111, 114)),
        borderRadius: BorderRadius.circular(15.r),
      ),
      leading: leading,
      title: Text(title, style: AppStyles.grey16),
      subtitle: Text(subtitle, style: AppStyles.black18),
    );
  }
}
