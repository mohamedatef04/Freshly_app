import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/functions/show_snak_bar.dart';
import 'package:freshly_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:freshly_app/features/auth/logic/cubits/google_signup/google_signup_cubit.dart';
import 'package:freshly_app/features/auth/logic/cubits/log_in/log_in_cubit.dart';
import 'package:freshly_app/features/auth/ui/widgets/login_view_body.dart';
import 'package:freshly_app/features/home/ui/views/main_home_view.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogInCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GoogleSignupCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state) {
          if (state is LogInSuccess) {
            GoRouter.of(context).pushReplacement(MainHomeView.routeName);
          } else if (state is LogInFailure) {
            showSnakBar(
              context,
              message: 'Invalid email or password',
              color: AppColors.blackColor,
            );
          }
        },
        builder: (context, state) {
          return BlocConsumer<GoogleSignupCubit, GoogleSignupState>(
            listener: (context, state) {
              if (state is GoogleSignupSuccess) {
                GoRouter.of(context).pushReplacement(MainHomeView.routeName);
              } else if (state is GoogleSignupError) {
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
                  inAsyncCall:
                      state is LogInLoading || state is GoogleSignupLoading,
                  child: const LoginViewBody(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
