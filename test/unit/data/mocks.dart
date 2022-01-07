import 'package:mocktail/mocktail.dart';
import 'package:playando/data/services/services.dart';
import 'package:playando/domain/repositories/repositories.dart';

class MockHttpClient extends Mock implements HttpClient {}

class MockSearchUseCase extends Mock implements SearchRepository {}
