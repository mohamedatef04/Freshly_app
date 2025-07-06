import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomAnimatedIndicator extends StatelessWidget {
  const CustomAnimatedIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.twistingDots(
      leftDotColor: AppColors.primaryColor,
      rightDotColor: AppColors.blackColor,

      size: 50.sp,
    );
  }
}
