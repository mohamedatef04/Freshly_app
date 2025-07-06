import 'package:flutter/material.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';

class CustomPasswordTextfield extends StatefulWidget {
  const CustomPasswordTextfield({super.key, required this.passwordController});
  final TextEditingController passwordController;

  @override
  State<CustomPasswordTextfield> createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  bool obsecuerText = true;
  @override
  Widget build(BuildContext context) {
    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^()\-_=+{}\[\]:;"<>,.?/\\|]).{8,}$',
    );
    return CustomTextFormField(
      controller: widget.passwordController,
      obscureText: obsecuerText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6 || !regex.hasMatch(value)) {
          return 'Password must be at least 8 characters long and\ncontain at least one letter and one number';
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
            obsecuerText = !obsecuerText;
          });
        },
        icon: Icon(
          obsecuerText ? Icons.visibility_off : Icons.visibility,
          color: const Color.fromARGB(141, 6, 22, 28),
        ),
      ),
    );
  }
}
