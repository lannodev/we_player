import 'package:json_annotation/json_annotation.dart';

import '../../shared/models/thumb_model.dart';
import '../interface/explore_model_interface.dart';
import 'playlist_model.dart';

part 'explore_playlist_model.g.dart';

@JsonSerializable()
class ExplorePlaylistModel implements IExplore {
  final List<PlayListModel> playlists;

  ExplorePlaylistModel({this.playlists});

  factory ExplorePlaylistModel.fromJson(Map<String, dynamic> json) => _$ExplorePlaylistModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExplorePlaylistModelToJson(this);

  @override
  int count;

  @override
  String id;

  @override
  @JsonKey(name: "next_from")
  String nextFrom;

  @override
  String source;

  @override
  String subtitle;

  @override
  List<ThumbModel> thumbs;

  @override
  String title;

  @override
  String type;
}
