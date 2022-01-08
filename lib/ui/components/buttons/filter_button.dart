import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    this.onTap,
    this.onTapClear,
    this.clear = false,
  }) : super(key: key);

  final VoidCallback? onTap;
  final VoidCallback? onTapClear;
  final bool clear;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clear ? onTapClear : onTap,
      child: Container(
        decoration: BoxDecoration(color: AppColors.secondary),
        child: Text(clear ? "Limpar Filtro" : "Filtrar"),
      ),
    );
  }
}
