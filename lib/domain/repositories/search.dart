import '../entities/entities.dart';

abstract class SearchRepository {
  Future<List<SnippetEntity>> search(String term);
  Future<SnippetEntity?> getVideoByUrl(String url);
}
