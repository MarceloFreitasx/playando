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

  factory SnippetEntity.fromJson(Map<String, dynamic> json) => SnippetEntity(
        publishedAt: DateTime.tryParse(json["publishedAt"]),
        channelId: json["channelId"] as String?,
        title: json["title"] as String?,
        description: json["description"] as String?,
        channelTitle: json["channelTitle"] as String?,
        liveBroadcast: json["liveBroadcast"] as bool?,
        publishTime: DateTime.tryParse(json["publishTime"]),
        thumbnails: json["thumbnails"] == null
            ? null
            : SnippetThumbnailsEntity.fromJson(json["thumbnails"]),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "publishedAt": publishedAt.toString(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "channelTitle": channelTitle,
        "liveBroadcast": liveBroadcast,
        "publishTime": publishTime.toString(),
        "thumbnails": thumbnails?.toJson(),
      };
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

  factory SnippetThumbnailsEntity.fromJson(Map<String, dynamic> json) => SnippetThumbnailsEntity(
        defaulte: json["default"] == null ? null : ThumbnailEntity.fromJson(json["default"]),
        medium: json["medium"] == null ? null : ThumbnailEntity.fromJson(json["medium"]),
        high: json["high"] == null ? null : ThumbnailEntity.fromJson(json["high"]),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "defaulte": defaulte?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
      };
}
