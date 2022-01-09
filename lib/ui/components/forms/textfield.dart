import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hint,
    this.controller,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
      validator: validator,
    );
  }
}
