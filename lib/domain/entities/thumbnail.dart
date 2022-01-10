class ThumbnailEntity {
  String? url;
  int? width;
  int? height;

  ThumbnailEntity({
    this.url,
    this.width,
    this.height,
  });

  factory ThumbnailEntity.fromJson(Map<String, dynamic> json) => ThumbnailEntity(
        url: json["url"] as String?,
        width: json["width"] as int?,
        height: json["height"] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "url": url,
        "width": width,
        "height": height,
      };
}
