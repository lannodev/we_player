import 'package:json_annotation/json_annotation.dart';

import 'photo_model.dart';

part 'artist_model.g.dart';

@JsonSerializable()
class ArtistModel {
  final String name;
  final String domain;
  final String id;
  @JsonKey(name: "is_album_cover")
  final String isAlbumCover;
  final PhotoModel photo;

  ArtistModel({
    this.name,
    this.domain,
    this.id,
    this.isAlbumCover,
    this.photo,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => _$ArtistModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}
