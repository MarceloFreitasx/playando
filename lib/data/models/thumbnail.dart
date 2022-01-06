import '../../domain/entities/entities.dart';

class ThumbnailModel {
  String? url;
  int? width;
  int? height;

  ThumbnailModel({
    this.url,
    this.width,
    this.height,
  });

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) => ThumbnailModel(
        url: json["url"] as String?,
        width: json["width"] as int?,
        height: json["height"] as int?,
      );

  ThumbnailEntity toEntity() => ThumbnailEntity(
        url: url,
        width: width,
        height: height,
      );
}
