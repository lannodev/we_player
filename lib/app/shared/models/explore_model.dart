import 'package:json_annotation/json_annotation.dart';

import 'music_model.dart';
import 'playlist_model.dart';
import 'thumb_model.dart';

part 'explore_model.g.dart';

@JsonSerializable()
class ExploreModel {
  final String title;
  final String subtitle;
  final String type;
  final int count;
  final String source;
  final String id;
  @JsonKey(name: "next_from")
  final String nextFrom;
  final List<MusicModel> audios;
  final List<ThumbModel> thumbs;
  final List<PlayListModel> playlists;

  ExploreModel({
    this.playlists,
    this.title,
    this.subtitle,
    this.type,
    this.count,
    this.source,
    this.id,
    this.nextFrom,
    this.audios,
    this.thumbs,
  });

  factory ExploreModel.fromJson(Map<String, dynamic> json) => _$ExploreModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExploreModelToJson(this);
}
