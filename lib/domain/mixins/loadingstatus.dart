import '../../data/helpers/helpers.dart';

abstract class LoadingMixin {
  LoadingStatus get loadingStatus;
  set loadingStatus(LoadingStatus value);
  bool get isLoading;
}
