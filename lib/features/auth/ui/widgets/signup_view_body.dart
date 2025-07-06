import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/core/widgets/custom_text_bottom.dart';
import 'package:freshly_app/features/auth/data/models/user_model.dart';
import 'package:freshly_app/features/auth/logic/cubits/sign_up/sign_up_cubit.dart';
import 'package:freshly_app/features/auth/ui/widgets/already_have_an_account_widget.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_address_textfield.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_confirm_password_textfield.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_email_textfield.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_name_textfield.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_password_textfield.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_phone_textfield.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),

        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
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

                    Text(
                      'Welcome to Freshly\nCreate an account !',
                      style: AppStyles.black24,
                    ),
                    CustomNameTextfield(nameController: nameController),

                    CustomEmailTextfield(emailController: emailController),
                    CustomPhoneTextfield(phoneController: phoneController),
                    CustomAddressTextfield(
                      addressController: addressController,
                    ),

                    CustomPasswordTextfield(
                      passwordController: passwordController,
                    ),
                    CustomConfirmPasswordTextfield(
                      confirmPasswordController: confirmPasswordController,
                      passwordController: passwordController,
                    ),

                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          context.read<SignUpCubit>().signUp(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            userModel: UserModel(
                              userName: nameController.text.trim(),
                              userEmail: emailController.text.trim(),
                              userAddress: addressController.text.trim(),
                              userPhone: phoneController.text.trim(),
                            ),
                          );
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      child: const CustomTextBottom(text: 'Sign Up'),
                    ),
                    const AlreadyHaveAnAccountWidget(),
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
