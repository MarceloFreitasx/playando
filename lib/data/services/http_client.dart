import '../helpers/helpers.dart';
import '../models/models.dart';

abstract class HttpClient {
  Future<HttpResponse> call(
    HttpMethod type,
    String url, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  });
}
