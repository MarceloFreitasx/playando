import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'di/di.dart';
import 'env/development.dart';
import 'env/env.dart';
import 'presentation/navigator/navigator.dart';

void main() => Development();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Playando',
      debugShowCheckedModeBanner: Env.to!.ambiente == 'dev',
      getPages: PagesRoutes.routes,
      initialRoute: PagesRoutes.initial,
      initialBinding: AppBindings(),
    );
  }
}
