import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/features/auth/logic/cubits/google_signup/google_signup_cubit.dart';

class GoogleSinupWidget extends StatelessWidget {
  const GoogleSinupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Or sign in with ', style: AppStyles.black14),
        GestureDetector(
          onTap: () {
            context.read<GoogleSignupCubit>().googleSignIn();
          },
          child: Text(
            'Google',
            style: AppStyles.black14.copyWith(color: AppColors.primaryColor),
          ),
        ),
        Image.asset(Assets.imagesGoogle, width: 30.w),
      ],
    );
  }
}
