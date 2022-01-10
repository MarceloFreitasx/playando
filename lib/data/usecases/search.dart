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
        ApiRoutes.search,
      );

      final data = result.data as List;
      return List<SnippetEntity>.from(data.map((e) => SnippetModel.fromJson(e).toEntity()));
    } on HttpResponse catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
