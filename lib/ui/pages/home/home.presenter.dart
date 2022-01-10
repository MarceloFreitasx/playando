import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class HomePresenter with LoadingMixin {
  List<SnippetEntity> get listVideos;

  bool get isYoutubeUrl;
  set isYoutubeUrl(bool value);

  bool get isListFiltered;
  set isListFiltered(bool value);

  int get videoPlaying;
  set videoPlaying(int value);
}
