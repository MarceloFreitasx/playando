import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.type = ColorType.primary,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final ColorType type;
  final String title;
  final VoidCallback? onTap;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: type.backgroundColor,
        onPrimary: type.backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...{
            Icon(
              icon!.icon,
              color: icon!.color ?? type.textColor,
            ),
            const SizedBox(width: 10),
          },
          Text(
            title,
            style: TextStyle(
              color: type.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
