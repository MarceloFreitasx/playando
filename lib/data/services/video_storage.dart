import 'package:get/get.dart';

import '../../domain/entities/entities.dart';

abstract class VideoStorageData {
  static VideoStorageData get to => Get.find();

  List<SnippetEntity> get videosList;

  List<dynamic> read();
  void write(List<SnippetEntity> value);
}
