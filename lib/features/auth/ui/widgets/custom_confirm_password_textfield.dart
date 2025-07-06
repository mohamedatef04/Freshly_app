import 'package:flutter/material.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';

class CustomConfirmPasswordTextfield extends StatefulWidget {
  const CustomConfirmPasswordTextfield({
    super.key,
    required this.confirmPasswordController,
    required this.passwordController,
  });
  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  State<CustomConfirmPasswordTextfield> createState() =>
      _CustomConfirmPasswordTextfieldState();
}

class _CustomConfirmPasswordTextfieldState
    extends State<CustomConfirmPasswordTextfield> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.confirmPasswordController,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Confirm your password';
        } else if (value != widget.passwordController.text) {
          return 'Passwords do not match';
        } else {
          return null;
        }
      },
      hintText: 'Confirm Password',

      prefixIcon: const Icon(
        Icons.lock_outlined,
        color: Color.fromARGB(141, 6, 22, 28),
      ),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: Color.fromARGB(141, 6, 22, 28),
        ),
      ),
    );
  }
}
