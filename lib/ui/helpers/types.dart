import 'package:flutter/material.dart';

import '../styles/styles.dart';

enum ColorType {
  primary,
  secondary,
}

extension ColorTypeExtension on ColorType {
  Color get backgroundColor {
    switch (this) {
      case ColorType.secondary:
        return AppColors.secondary;
      default:
        return AppColors.primary;
    }
  }

  Color get textColor {
    switch (this) {
      case ColorType.secondary:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}
