import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/core/widgets/custom_text_bottom.dart';
import 'package:freshly_app/features/auth/logic/cubits/log_in/log_in_cubit.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_email_textfield.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_forget_password_widget.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_login_passsword_textfield.dart';
import 'package:freshly_app/features/auth/ui/widgets/dont_have_account_widget.dart';
import 'package:freshly_app/features/auth/ui/widgets/google_sinup_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  spacing: 15.h,
                  mainAxisAlignment: MainAxisAlignment.center,
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

                    Text('Welcome to Freshly', style: AppStyles.black24),

                    CustomEmailTextfield(emailController: emailController),

                    CustomLoginPassswordTextfield(
                      passwordController: passwordController,
                    ),

                    const CustomForgetPasswordWidget(),

                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<LogInCubit>().logIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      child: const CustomTextBottom(text: 'Login'),
                    ),
                    const DontHaveAccountWidget(),

                    const GoogleSinupWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
