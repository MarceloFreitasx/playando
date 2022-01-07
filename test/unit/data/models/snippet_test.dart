import 'package:playando/data/models/models.dart';
import 'package:playando/domain/entities/entities.dart';
import 'package:test/test.dart';

void main() {
  late Map<String, dynamic> json;
  late SnippetModel model;

  setUp(() {
    json = {
      "publishedAt": "2018-01-16T22:00:03Z",
      "channelId": "UCDpenlfHFtjdGpqi8slPybg",
      "title": "Cooking with Marshmello: How To Make Greek Salad",
      "description":
          "Cooking with Marshmello: How To Make Greek Salad Hello loves, This week on Cooking with Marshmello we make the best ...",
      "thumbnails": {
        "default": {
          "url": "https://i.ytimg.com/vi/dh6ob389CYU/default.jpg",
          "width": 120,
          "height": 90
        },
        "medium": {
          "url": "https://i.ytimg.com/vi/dh6ob389CYU/mqdefault.jpg",
          "width": 320,
          "height": 180
        },
        "high": {
          "url": "https://i.ytimg.com/vi/dh6ob389CYU/hqdefault.jpg",
          "width": 480,
          "height": 360
        }
      },
      "channelTitle": "Cooking With Marshmello",
      "liveBroadcastContent": "none",
      "publishTime": "2018-01-16T22:00:03Z"
    };
  });

  group('Snippet model convert test:', () {
    test('Should convert JSON to MODEL', () {
      model = SnippetModel.fromJson(json);

      expect(model.title, "Cooking with Marshmello: How To Make Greek Salad");
      expect(model.channelId, "UCDpenlfHFtjdGpqi8slPybg");
      expect(model.publishedAt, "2018-01-16T22:00:03Z");
    });

    test('Should convert MODEL to ENTITY', () {
      final entity = model.toEntity();

      expect(entity.runtimeType, SnippetEntity);
      expect(entity.title, model.title);
      expect(entity.channelId, model.channelId);
      expect(entity.publishedAt, DateTime(2018, 01, 16, 20, 00, 03));
    });
  });
}
