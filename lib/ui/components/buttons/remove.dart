import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.secondary,
        child: const Icon(
          Icons.cancel_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
