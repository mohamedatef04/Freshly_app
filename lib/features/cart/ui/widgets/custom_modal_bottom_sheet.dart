import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:freshly_app/features/cart/ui/widgets/payment_navigation.dart';

void cusomModalBottomSheet(
  BuildContext context, {
  required List<ProductModel> cartProducts,
  required double price,
}) {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: Column(
                  spacing: 10.h,
                  children: [
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      controller: fullNameController,
                      hintText: 'Full Name',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      prefixIcon: const Icon(Icons.email),
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please enter your email';
                        } else if (!p0.contains('@')) {
                          return 'Please enter a valid email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,

                      hintText: 'Phone',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      prefixIcon: const Icon(Icons.phone),
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (p0.length < 11) {
                          return 'Please enter a valid phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFormField(
                      controller: addressController,
                      hintText: 'Address',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      prefixIcon: const Icon(Icons.location_on_outlined),
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFormField(
                      controller: cityController,
                      hintText: 'City',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      prefixIcon: const Icon(Icons.location_city),
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),

                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          paymentNavigation(
                            context,
                            fullNameController,
                            emailController,
                            phoneController,
                            addressController,
                            cityController,
                            cartProducts,
                            price,
                          );
                        } else {}
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,

                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Center(
                          child: Text(
                            'Complete Checkout',
                            style: AppStyles.white16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
