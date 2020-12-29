// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExploreMusicModel _$ExploreMusicModelFromJson(Map<String, dynamic> json) {
  return ExploreMusicModel(
    audios: (json['audios'] as List)
        ?.map((e) =>
            e == null ? null : MusicModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ExploreMusicModelToJson(ExploreMusicModel instance) =>
    <String, dynamic>{
      'audios': instance.audios,
      'count': instance.count,
      'id': instance.id,
      'next_from': instance.nextFrom,
      'source': instance.source,
      'subtitle': instance.subtitle,
      'thumbs': instance.thumbs,
      'title': instance.title,
      'type': instance.type,
    };
