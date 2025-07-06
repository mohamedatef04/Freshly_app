import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';

class CustomProductIngredient extends StatelessWidget {
  const CustomProductIngredient({
    super.key,
    required this.image,
    required this.text,
    required this.title,
  });
  final String image;
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffF1F1F5)),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Expanded(child: Image.asset(image, width: 35.w, height: 35.h)),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: AppStyles.white16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    title,
                    style: AppStyles.black14.copyWith(
                      color: const Color(0xff979899),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
