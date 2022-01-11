import '../../../domain/entities/entities.dart';

abstract class HomePresenter {
  List<SnippetEntity> get listVideos;

  bool get isYoutubeUrl;
  set isYoutubeUrl(bool value);

  bool get isListFiltered;
  set isListFiltered(bool value);

  SnippetEntity? get videoPlaying;
  set videoPlaying(SnippetEntity? value);
}
