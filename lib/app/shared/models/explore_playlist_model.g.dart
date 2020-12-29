// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExplorePlaylistModel _$ExplorePlaylistModelFromJson(Map<String, dynamic> json) {
  return ExplorePlaylistModel(
    playlists: (json['playlists'] as List)
        ?.map((e) => e == null
            ? null
            : PlayListModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..count = json['count'] as int
    ..id = json['id'] as String
    ..nextFrom = json['next_from'] as String
    ..source = json['source'] as String
    ..subtitle = json['subtitle'] as String
    ..thumbs = (json['thumbs'] as List)
        ?.map((e) =>
            e == null ? null : ThumbModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..title = json['title'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$ExplorePlaylistModelToJson(
        ExplorePlaylistModel instance) =>
    <String, dynamic>{
      'playlists': instance.playlists,
      'count': instance.count,
      'id': instance.id,
      'next_from': instance.nextFrom,
      'source': instance.source,
      'subtitle': instance.subtitle,
      'thumbs': instance.thumbs,
      'title': instance.title,
      'type': instance.type,
    };
