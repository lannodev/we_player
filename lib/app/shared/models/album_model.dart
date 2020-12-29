import 'package:json_annotation/json_annotation.dart';

import 'thumb_model.dart';

part 'album_model.g.dart';

@JsonSerializable()
class AlbumModel {
  final int id;
  final String title;
  @JsonKey(name: "owner_id")
  final int ownerId;
  @JsonKey(name: "access_key")
  final String accessKey;
  final ThumbModel thumb;

  AlbumModel({
    this.id,
    this.title,
    this.ownerId,
    this.accessKey,
    this.thumb,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}
