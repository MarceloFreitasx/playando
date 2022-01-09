import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.type = ColorType.primary,
  }) : super(key: key);

  final ColorType type;
  final TextEditingController? controller;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        focusColor: type.backgroundColor,
      ),
      style: TextStyle(
        color: type.textColor,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
