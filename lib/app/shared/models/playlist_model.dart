import 'package:json_annotation/json_annotation.dart';

import 'main_artist_model.dart';
import 'thumb_model.dart';

part 'playlist_model.g.dart';

@JsonSerializable()
class PlayListModel {
  final int id;
  @JsonKey(name: "owner_id")
  final int ownerId;
  final int type;
  final String title;
  final String description;
  final int count;
  final int followers;
  final int plays;
  @JsonKey(name: "create_time")
  final int createTime;
  @JsonKey(name: "update_time")
  final int updateTime;
  //final GenreModel genres;
  final int year;
  final ThumbModel photo;
  @JsonKey(name: "access_key")
  final String accessKey;
  final MainArtistModel mainArtists;
  @JsonKey(name: "is_blocked")
  final bool isBlocked;
  @JsonKey(name: "album_type")
  final String albumType;

  PlayListModel({
    this.id,
    this.ownerId,
    this.type,
    this.title,
    this.description,
    this.count,
    this.followers,
    this.plays,
    this.createTime,
    this.updateTime,
    //this.genres,
    this.year,
    this.photo,
    this.accessKey,
    this.mainArtists,
    this.isBlocked,
    this.albumType,
  });

  factory PlayListModel.fromJson(Map<String, dynamic> json) => _$PlayListModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlayListModelToJson(this);
}
