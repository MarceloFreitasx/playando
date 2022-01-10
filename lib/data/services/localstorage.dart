abstract class LocalStorageData<T> {
  bool has();
  T read();
  void write(T value);
  void remove();
  void listenKey(Function(T value) onChange);
}
