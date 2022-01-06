import 'thumbnail.dart';

class SnippetModel {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  String? channelTitle;
  String? liveBroadcastContent;
  String? publishTime;
  Map<String, ThumbnailModel>? thumbnails;

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
          thumbnails: {
            "default": ThumbnailModel.fromJson(json["thumbnails"]["default"]),
            "medium": ThumbnailModel.fromJson(json["thumbnails"]["medium"]),
            "high": ThumbnailModel.fromJson(json["thumbnails"]["high"]),
          });
}
