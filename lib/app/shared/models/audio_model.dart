import 'package:json_annotation/json_annotation.dart';

import 'album_model.dart';
import 'main_artist_model.dart';

part 'audio_model.g.dart';

@JsonSerializable()
class AudioModel {
  final String artist;
  final int id;
  @JsonKey(name: "owner_id")
  final int ownerId;
  final String title;
  final int duration;
  @JsonKey(name: "access_key")
  final String accessKey;
  //final AdsModel ads;
  @JsonKey(name: "is_licensed")
  final bool isLicensed;
  @JsonKey(name: "track_code")
  final String trackCode;
  final String url;
  final int date;
  final AlbumModel album;
  final MainArtistModel mainArtists;
  final String subtitle;

  AudioModel({
    this.artist,
    this.id,
    this.ownerId,
    this.title,
    this.duration,
    this.accessKey,
    //this.ads,
    this.isLicensed,
    this.trackCode,
    this.url,
    this.date,
    this.album,
    this.mainArtists,
    this.subtitle,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => _$AudioModelFromJson(json);
  Map<String, dynamic> toJson() => _$AudioModelToJson(this);
}
