import 'package:flutter/material.dart';
import 'package:freshly_app/core/services/supabase_auth_service.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/features/home/ui/views/main_home_view.dart';
import 'package:freshly_app/features/onboarding/ui/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      bool isSignedIn = await SupabaseAuthService().isSignedIn();
      if (isSignedIn) {
        GoRouter.of(context).pushReplacement(MainHomeView.routeName);
      } else {
        GoRouter.of(context).pushReplacement(OnboardingView.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Image.asset(Assets.imagesSplash, fit: BoxFit.fill),
      ),
    );
  }
}
