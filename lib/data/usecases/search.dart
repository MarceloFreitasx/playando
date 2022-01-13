import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../constants/apiroutes.dart';
import '../helpers/helpers.dart';
import '../models/models.dart';
import '../services/services.dart';

class SearchUseCase implements SearchRepository {
  SearchUseCase(this.api);

  HttpClient api;

  @override
  Future<List<SnippetEntity>> search(String term) async {
    try {
      final result = await api.call(
        HttpMethod.get,
        ApiRoutes.search(term),
      );

      final data = result.data["items"] as List;

      return List<SnippetEntity>.from(
          data.map((e) => SnippetModel.fromJson(e['snippet']).toEntity()));
    } on HttpResponse catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SnippetEntity?> getVideoByUrl(String url) async {
    try {
      final result = await api.call(
        HttpMethod.get,
        ApiRoutes.search(url),
      );

      final data = result.data["items"] as List;

      return data.isEmpty ? null : SnippetModel.fromJson(data.first['snippet']).toEntity();
    } on HttpResponse catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
