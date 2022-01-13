import 'package:get/get.dart';

import '../../data/services/services.dart';
import '../../domain/entities/entities.dart';
import '../../ui/pages/pages.dart';

class HomePresentation extends GetxController implements HomePresenter {
  HomePresentation() {
    clearFilter();
  }

  final _originalListVideos = <SnippetEntity>[];
  final _listVideos = RxList<SnippetEntity>.empty();
  final _isYoutubeUrl = RxBool(false);
  final _isListFiltered = RxBool(false);
  final _videoPlaying = Rxn<SnippetEntity>();

  @override
  List<SnippetEntity> get listVideos => _listVideos;

  @override
  List<SnippetEntity> get originalListVideos => _originalListVideos;

  @override
  bool get isYoutubeUrl => _isYoutubeUrl.value;

  @override
  set isYoutubeUrl(bool value) => _isYoutubeUrl.value = value;

  @override
  bool get isListFiltered => _isListFiltered.value;

  @override
  set isListFiltered(bool value) {
    _isListFiltered.value = value;
    if (!value) clearFilter();
  }

  @override
  SnippetEntity? get videoPlaying => _videoPlaying.value;

  @override
  set videoPlaying(SnippetEntity? value) {
    _videoPlaying.value = value;
  }

  @override
  void clearFilter() {
    _isListFiltered.value = false;
    _originalListVideos.assignAll(VideoStorageData.to.videosList);
    _listVideos.assignAll(_originalListVideos);
  }
}
