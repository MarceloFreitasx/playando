import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'env/development.dart';
import 'env/env.dart';

void main() => Development();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Playando',
      debugShowCheckedModeBanner: Env.to!.ambiente == 'dev',
    );
  }
}
