import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class SearchPresenter with LoadingMixin {
  List<SnippetEntity> get listVideos;
}
