import 'package:playando/data/models/models.dart';
import 'package:playando/domain/entities/thumbnail.dart';
import 'package:test/test.dart';

void main() {
  late Map<String, dynamic> json;
  late ThumbnailModel model;

  setUp(() {
    json = {
      "url": "https://i.ytimg.com/vi/dh6ob389CYU/default.jpg",
      "width": 120,
      "height": 90,
    };
  });

  group('Thumbnail model convert test:', () {
    test('Should convert JSON to MODEL', () {
      model = ThumbnailModel.fromJson(json);

      expect(model.url, "https://i.ytimg.com/vi/dh6ob389CYU/default.jpg");
      expect(model.width, 120);
      expect(model.height, 90);
    });

    test('Should convert MODEL to ENTITY', () {
      final entity = model.toEntity();

      expect(entity.runtimeType, ThumbnailEntity);
      expect(entity.url, model.url);
      expect(entity.width, model.width);
      expect(entity.height, model.height);
    });
  });
}
