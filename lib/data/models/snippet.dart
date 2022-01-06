import '../../domain/entities/entities.dart';
import 'thumbnail.dart';

class SnippetModel {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  String? channelTitle;
  String? liveBroadcastContent;
  String? publishTime;
  SnippetThumbnailsModel? thumbnails;

  SnippetModel({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
    this.thumbnails,
  });

  factory SnippetModel.fromJson(Map<String, dynamic> json) => SnippetModel(
        publishedAt: json["publishedAt"] as String?,
        channelId: json["channelId"] as String?,
        title: json["title"] as String?,
        description: json["description"] as String?,
        channelTitle: json["channelTitle"] as String?,
        liveBroadcastContent: json["liveBroadcastContent"] as String?,
        publishTime: json["publishTime"] as String?,
        thumbnails:
            json["thumbnails"] == null ? null : SnippetThumbnailsModel.fromJson(json["thumbnails"]),
      );

  SnippetEntity toEntity() => SnippetEntity(
        publishedAt: publishedAt != null ? DateTime.tryParse(publishedAt!)?.toLocal() : null,
        channelId: channelId,
        title: title,
        description: description,
        channelTitle: channelTitle,
        liveBroadcastContent: liveBroadcastContent,
        publishTime: publishedAt != null ? DateTime.tryParse(publishTime!)?.toLocal() : null,
        thumbnails: thumbnails?.toEntity(),
      );
}

class SnippetThumbnailsModel {
  ThumbnailModel? defaulte;
  ThumbnailModel? medium;
  ThumbnailModel? high;

  SnippetThumbnailsModel({
    this.defaulte,
    this.medium,
    this.high,
  });

  factory SnippetThumbnailsModel.fromJson(Map<String, dynamic> json) => SnippetThumbnailsModel(
        defaulte: json["default"] == null ? null : ThumbnailModel.fromJson(json["default"]),
        medium: json["medium"] == null ? null : ThumbnailModel.fromJson(json["medium"]),
        high: json["high"] == null ? null : ThumbnailModel.fromJson(json["high"]),
      );

  SnippetThumbnailsEntity toEntity() => SnippetThumbnailsEntity(
        defaulte: defaulte?.toEntity(),
        medium: medium?.toEntity(),
        high: high?.toEntity(),
      );
}
