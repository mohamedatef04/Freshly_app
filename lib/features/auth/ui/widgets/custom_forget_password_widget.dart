import 'package:flutter/material.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/features/auth/ui/views/forget_password_view.dart';
import 'package:go_router/go_router.dart';

class CustomForgetPasswordWidget extends StatelessWidget {
  const CustomForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(ForgetPasswordView.routeName);
          },
          child: Text(
            'Forgot Password ? ',
            style: AppStyles.black14.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
