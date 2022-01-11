import 'package:get/get.dart';

import '../../data/helpers/helpers.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class SearchPresentation extends GetxController with LoadingManager implements SearchPresenter {
  SearchPresentation(this._repository) {
    print(Get.arguments);
    findVideo(Get.arguments);
  }

  final _listVideos = RxList<SnippetEntity>.empty();

  final SearchRepository _repository;

  @override
  List<SnippetEntity> get listVideos => _listVideos;

  void findVideo(String term) async {
    _listVideos.clear();
    try {
      loadingStatus = LoadingStatus.loading;
      await _repository.search(term).then((value) {
        _listVideos.assignAll(value);
        loadingStatus = LoadingStatus.completed;
      });
    } catch (_) {
      loadingStatus = LoadingStatus.error;
    }
  }
}
