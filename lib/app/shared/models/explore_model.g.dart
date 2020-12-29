// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExploreModel _$ExploreModelFromJson(Map<String, dynamic> json) {
  return ExploreModel(
    playlists: (json['playlists'] as List)
        ?.map((e) => e == null
            ? null
            : PlayListModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    type: json['type'] as String,
    count: json['count'] as int,
    source: json['source'] as String,
    id: json['id'] as String,
    nextFrom: json['next_from'] as String,
    audios: (json['audios'] as List)
        ?.map((e) =>
            e == null ? null : MusicModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    thumbs: (json['thumbs'] as List)
        ?.map((e) =>
            e == null ? null : ThumbModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ExploreModelToJson(ExploreModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': instance.type,
      'count': instance.count,
      'source': instance.source,
      'id': instance.id,
      'next_from': instance.nextFrom,
      'audios': instance.audios,
      'thumbs': instance.thumbs,
      'playlists': instance.playlists,
    };
