import 'entities.dart';

class SnippetEntity {
  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  String? channelTitle;
  bool? liveBroadcast;
  DateTime? publishTime;
  SnippetThumbnailsEntity? thumbnails;

  SnippetEntity({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.channelTitle,
    this.liveBroadcast,
    this.publishTime,
    this.thumbnails,
  });
}

class SnippetThumbnailsEntity {
  ThumbnailEntity? defaulte;
  ThumbnailEntity? medium;
  ThumbnailEntity? high;

  SnippetThumbnailsEntity({
    this.defaulte,
    this.medium,
    this.high,
  });
}
