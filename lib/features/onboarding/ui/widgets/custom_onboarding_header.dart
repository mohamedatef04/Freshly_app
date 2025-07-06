import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/features/auth/ui/views/login_view.dart';
import 'package:go_router/go_router.dart';

class CustomOnboardingHeader extends StatelessWidget {
  const CustomOnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: AppColors.whiteColor),
        ),
        Positioned(
          left: 340.w,
          child: Image.asset(Assets.imagesOnboardingHeader, width: 45.w),
        ),
        Positioned(
          top: 75.h,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 66.w,
                  height: 66.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 204, 208, 212),
                  ),
                  child: Center(
                    child: Image.asset(Assets.imagesLogo, width: 40.w),
                  ),
                ),
                Text(
                  'Get your groceries\ndelivered to your home',
                  textAlign: TextAlign.center,
                  style: AppStyles.black28,
                ),
                Text(
                  'The best delivery app in town for\ndelivering your daily fresh groceries',
                  textAlign: TextAlign.center,
                  style: AppStyles.grey16,
                ),

                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(LoginView.routeName);
                  },
                  child: Container(
                    width: 190.w,
                    height: 53.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(35.r),
                    ),
                    child: Center(
                      child: Text('Shop now', style: AppStyles.white16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
