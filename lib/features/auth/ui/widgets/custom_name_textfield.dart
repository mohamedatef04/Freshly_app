import 'package:flutter/material.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';

class CustomNameTextfield extends StatelessWidget {
  const CustomNameTextfield({super.key, required this.nameController});
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        } else {
          return null;
        }
      },
      hintText: 'Username',

      prefixIcon: const Icon(
        Icons.person_2_outlined,
        color: Color.fromARGB(141, 6, 22, 28),
      ),
    );
  }
}
