import 'package:flutter/material.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/features/auth/ui/views/signup_view.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account ? ', style: AppStyles.black14),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(SignupView.routeName);
          },
          child: Text(
            'Sign Up',
            style: AppStyles.black14.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
