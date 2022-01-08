import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: AppColors.primary),
        child: const Text("Adicionar"),
      ),
    );
  }
}
