// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) {
  return ArtistModel(
    name: json['name'] as String,
    domain: json['domain'] as String,
    id: json['id'] as String,
    isAlbumCover: json['is_album_cover'] as String,
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'domain': instance.domain,
      'id': instance.id,
      'is_album_cover': instance.isAlbumCover,
      'photo': instance.photo,
    };
