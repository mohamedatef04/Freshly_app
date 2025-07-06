import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/functions/show_snak_bar.dart';
import 'package:freshly_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:freshly_app/features/auth/logic/cubits/sign_up/sign_up_cubit.dart';
import 'package:freshly_app/features/auth/ui/widgets/signup_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            showSnakBar(
              context,
              message: 'Account created successfully',
              color: AppColors.blackColor,
            );
            GoRouter.of(context).pop();
          } else if (state is SignUpError) {
            showSnakBar(
              context,
              message: state.errorMessage,
              color: AppColors.blackColor,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: state is SignUpLoading,
              child: const SignupViewBody(),
            ),
          );
        },
      ),
    );
  }
}
