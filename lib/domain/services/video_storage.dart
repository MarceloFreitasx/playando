import 'package:get/get.dart';

import '../../data/services/localstorage.dart';
import '../../data/services/services.dart';
import '../entities/entities.dart';

class VideoStorage extends GetxController implements VideoStorageData {
  VideoStorage(this._box) {
    _videosList.value = _videos;
    _box.listenKey((val) {
      _videosList.value = _videos;
      _videosList.refresh();
    });
  }

  final LocalStorageData _box;
  final _videosList = RxList<SnippetEntity>.empty();
  List<SnippetEntity> get _videos =>
      _box.has() ? read().map((e) => SnippetEntity.fromJson(e)).toList() : [];

  @override
  List<SnippetEntity> get videosList => _videosList;

  @override
  List<dynamic> read() => _box.read();

  @override
  void write(List<SnippetEntity> value) => _box.write(value.map((e) => e.toJson()).toList());
}
