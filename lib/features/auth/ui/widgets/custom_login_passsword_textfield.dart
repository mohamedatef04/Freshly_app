import 'package:flutter/material.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';

class CustomLoginPassswordTextfield extends StatefulWidget {
  const CustomLoginPassswordTextfield({
    super.key,
    required this.passwordController,
  });
  final TextEditingController passwordController;

  @override
  State<CustomLoginPassswordTextfield> createState() =>
      _CustomLoginPassswordTextfieldState();
}

class _CustomLoginPassswordTextfieldState
    extends State<CustomLoginPassswordTextfield> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.passwordController,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else {
          return null;
        }
      },
      hintText: 'password',

      prefixIcon: const Icon(
        Icons.password_outlined,
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
          color: const Color.fromARGB(141, 6, 22, 28),
        ),
      ),
    );
  }
}
