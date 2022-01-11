import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Parece que não foram encontrados\nresultados para sua busca',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Icon(
            Icons.cancel_rounded,
            size: 64,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text("Clique aqui para voltar"),
          ),
        ],
      ),
    );
  }
}
