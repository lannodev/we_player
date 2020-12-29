// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListModel _$PlayListModelFromJson(Map<String, dynamic> json) {
  return PlayListModel(
    id: json['id'] as int,
    ownerId: json['owner_id'] as int,
    type: json['type'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    count: json['count'] as int,
    followers: json['followers'] as int,
    plays: json['plays'] as int,
    createTime: json['create_time'] as int,
    updateTime: json['update_time'] as int,
    year: json['year'] as int,
    photo: json['photo'] == null
        ? null
        : ThumbModel.fromJson(json['photo'] as Map<String, dynamic>),
    accessKey: json['access_key'] as String,
    mainArtists: json['mainArtists'] == null
        ? null
        : MainArtistModel.fromJson(json['mainArtists'] as Map<String, dynamic>),
    isBlocked: json['is_blocked'] as bool,
    albumType: json['album_type'] as String,
  );
}

Map<String, dynamic> _$PlayListModelToJson(PlayListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'count': instance.count,
      'followers': instance.followers,
      'plays': instance.plays,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'year': instance.year,
      'photo': instance.photo,
      'access_key': instance.accessKey,
      'mainArtists': instance.mainArtists,
      'is_blocked': instance.isBlocked,
      'album_type': instance.albumType,
    };
