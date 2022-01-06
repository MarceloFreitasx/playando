import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';

import 'package:playando/data/helpers/helpers.dart';
import 'package:playando/data/models/http_response.dart';
import 'package:playando/data/services/services.dart';
import 'package:test/test.dart';

void main() {
  late HttpClient httpClient;
  late String url;
  late HttpResponse response;

  setUp(() {
    httpClient = MockHttpClient();
    url = faker.internet.httpsUrl();
    response = HttpResponse(faker.vehicle.vehicle(), HttpStatus.success);
  });

  test('Should call HttpClient with correct URL', () async {
    when(() => httpClient.call(HttpMethod.get, url)).thenAnswer((_) async => response);

    expect(await httpClient.call(HttpMethod.get, url), response);
  });
}

class MockHttpClient extends Mock implements HttpClient {}
