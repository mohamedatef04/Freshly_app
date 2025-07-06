import 'package:flutter/material.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';

class CustomPhoneTextfield extends StatelessWidget {
  const CustomPhoneTextfield({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: phoneController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        } else {
          return null;
        }
      },
      hintText: 'Phone Number',

      prefixIcon: const Icon(
        Icons.phone_android_outlined,
        color: Color.fromARGB(141, 6, 22, 28),
      ),
    );
  }
}
