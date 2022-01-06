import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../main.dart';

class Env {
  Env() {
    to = this;
    main();
  }

  static Env? to;
  String? token;
  String? baseUrl;
  String? ambiente;

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    runApp(const MyApp());
  }
}
