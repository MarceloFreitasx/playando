import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    this.onTap,
    this.clear = false,
  }) : super(key: key);

  final VoidCallback? onTap;
  final bool clear;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: AppColors.primary,
        child: IconButton(
          icon: Icon(clear ? Icons.cancel_rounded : Icons.filter_alt_rounded),
          onPressed: onTap,
          tooltip: clear ? "Limpar Filtro" : "Filtrar",
        ),
      ),
    );
  }
}
