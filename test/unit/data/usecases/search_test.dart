import 'package:mocktail/mocktail.dart';
import 'package:playando/domain/entities/entities.dart';
import 'package:playando/domain/repositories/repositories.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  late SearchRepository repository;
  late List<SnippetEntity> response;

  setUp(() {
    repository = MockSearchUseCase();
    response = <SnippetEntity>[];
  });

  group("SearchUseCase tests", () {
    test('Should call SearchUseCase with correct values', () async {
      when(() => repository.search("lofi")).thenAnswer((_) async => response);
      expect(await repository.search("lofi"), response);
    });
  });
}
