import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../helpers/helpers.dart';

class FilterFormWidget extends StatelessWidget {
  const FilterFormWidget({
    Key? key,
    required this.onTap,
    this.initialValue,
  }) : super(key: key);

  final String? initialValue;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    _controller.text = initialValue ?? '';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              hint: "Palavras-chave",
              controller: _controller,
              type: ColorType.secondary,
            ),
            const SizedBox(height: 10),
            CustomButton(
              title: "Filtrar",
              icon: const Icon(Icons.filter_alt_rounded),
              onTap: () => onTap(_controller.text),
            ),
          ],
        ),
      ),
    );
  }
}
