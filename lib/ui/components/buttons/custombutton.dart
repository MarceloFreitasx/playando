import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.filter_alt_rounded),
      onPressed: onTap,
      label: Text(title),
    );
  }
}
