import 'package:get_storage/get_storage.dart';

import '../data/services/localstorage.dart';

class LocalStorageService<T> implements LocalStorageData {
  LocalStorageService(this._key);

  final String _key;
  final _box = GetStorage();

  @override
  bool has() => _box.hasData(_key);

  @override
  T read() => _box.read(_key);

  @override
  void write(dynamic value) {
    _box.write(_key, value);
  }

  @override
  void remove() => _box.remove(_key);

  @override
  void listenKey(Function(dynamic value) onChange) {
    _box.listenKey(_key, onChange);
  }
}
