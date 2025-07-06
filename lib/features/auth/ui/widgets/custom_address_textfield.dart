import 'package:flutter/material.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';

class CustomAddressTextfield extends StatelessWidget {
  const CustomAddressTextfield({super.key, required this.addressController});
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: addressController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your address';
        } else {
          return null;
        }
      },
      hintText: 'Address',

      prefixIcon: const Icon(
        Icons.location_on_outlined,
        color: Color.fromARGB(141, 6, 22, 28),
      ),
    );
  }
}
