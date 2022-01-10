import 'package:get/get.dart';

import '../../data/services/video_storage.dart';
import '../../domain/entities/snippet.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class HomePresentation extends GetxController with LoadingManager implements HomePresenter {
  HomePresentation() {
    _listVideos.assignAll(VideoStorageData.to.videosList);
  }

  final _listVideos = RxList<SnippetEntity>.empty();
  final _isYoutubeUrl = RxBool(false);
  final _isListFiltered = RxBool(false);
  final _videoPlaying = RxInt(-1);

  @override
  List<SnippetEntity> get listVideos => _listVideos;

  @override
  bool get isYoutubeUrl => _isYoutubeUrl.value;

  @override
  set isYoutubeUrl(bool value) => _isYoutubeUrl.value = value;

  @override
  bool get isListFiltered => _isListFiltered.value;

  @override
  set isListFiltered(bool value) {
    _isListFiltered.value = value;
  }

  @override
  int get videoPlaying => _videoPlaying.value;

  @override
  set videoPlaying(int value) {
    _videoPlaying.value = value;
  }
}
