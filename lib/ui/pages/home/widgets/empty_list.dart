import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Parece que sua lista está vazia'),
          SizedBox(height: 20),
          Icon(
            Icons.hourglass_empty_rounded,
            size: 64,
          ),
          SizedBox(height: 20),
          Text('Adicione seus vídeos favoritos aqui.'),
        ],
      ),
    );
  }
}
