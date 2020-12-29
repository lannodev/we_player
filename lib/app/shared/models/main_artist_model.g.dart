// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainArtistModel _$MainArtistModelFromJson(Map<String, dynamic> json) {
  return MainArtistModel(
    name: json['name'] as String,
    domain: json['domain'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$MainArtistModelToJson(MainArtistModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'domain': instance.domain,
      'id': instance.id,
    };
