import '../helpers/http_method.dart';
import '../models/http_response.dart';

abstract class HttpClient {
  Future<HttpResponse> call(
    HttpMethod type,
    String url, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  });
}
