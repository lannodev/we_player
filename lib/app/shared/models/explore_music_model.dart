import 'package:json_annotation/json_annotation.dart';

import '../../shared/models/thumb_model.dart';
import '../interface/explore_model_interface.dart';
import 'music_model.dart';

part 'explore_music_model.g.dart';

@JsonSerializable()
class ExploreMusicModel implements IExplore {
  final List<MusicModel> audios;

  ExploreMusicModel({this.audios});

  factory ExploreMusicModel.fromJson(Map<String, dynamic> json) => _$ExploreMusicModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExploreMusicModelToJson(this);

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
