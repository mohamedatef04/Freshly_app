import 'package:flutter/material.dart';

import 'package:freshly_app/features/onboarding/ui/widgets/custom_onboarding_bottom.dart';
import 'package:freshly_app/features/onboarding/ui/widgets/custom_onboarding_header.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: const Column(
            children: [
              Expanded(child: CustomOnboardingHeader()),
              Expanded(child: CustomOnboardingBottom()),
            ],
          ),
        ),
      ),
    );
  }
}
