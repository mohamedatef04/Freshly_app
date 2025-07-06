import 'package:flutter/material.dart';
import 'package:freshly_app/core/services/supabase_auth_service.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/features/auth/ui/views/login_view.dart';
import 'package:go_router/go_router.dart';

class CustomLogOutWidget extends StatelessWidget {
  const CustomLogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Logout', style: AppStyles.black20),
        IconButton(
          onPressed: () async {
            await SupabaseAuthService().signOut();
            GoRouter.of(context).pushReplacement(LoginView.routeName);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}
