// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return AlbumModel(
    id: json['id'] as int,
    title: json['title'] as String,
    ownerId: json['owner_id'] as int,
    accessKey: json['access_key'] as String,
    thumb: json['thumb'] == null
        ? null
        : ThumbModel.fromJson(json['thumb'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AlbumModelToJson(AlbumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'owner_id': instance.ownerId,
      'access_key': instance.accessKey,
      'thumb': instance.thumb,
    };
