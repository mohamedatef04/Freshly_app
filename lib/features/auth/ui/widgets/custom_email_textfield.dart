import 'package:flutter/material.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';

class CustomEmailTextfield extends StatelessWidget {
  const CustomEmailTextfield({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!value.contains('@')) {
          return 'Please enter a valid email';
        } else {
          return null;
        }
      },
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: Color.fromARGB(141, 6, 22, 28),
      ),

      hintText: 'Email',
    );
  }
}
