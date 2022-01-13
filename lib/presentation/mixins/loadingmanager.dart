import 'package:get/get.dart';

import '../../data/helpers/helpers.dart';
import '../../domain/mixins/mixins.dart';

mixin LoadingManager on GetxController implements LoadingMixin {
  final _loadingStatus = LoadingStatus.completed.obs;

  @override
  LoadingStatus get loadingStatus => _loadingStatus.value;

  @override
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  @override
  bool get isLoading => loadingStatus == LoadingStatus.loading;
}
