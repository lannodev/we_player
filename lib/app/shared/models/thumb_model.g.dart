// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumb_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbModel _$ThumbModelFromJson(Map<String, dynamic> json) {
  return ThumbModel(
    width: json['width'] as int,
    height: json['height'] as int,
    photo34: json['photo_34'] as String,
    photo68: json['photo_68'] as String,
    photo135: json['photo_135'] as String,
    photo270: json['photo_270'] as String,
    photo300: json['photo_300'] as String,
    photo600: json['photo_600'] as String,
    photo1200: json['photo_1200'] as String,
  );
}

Map<String, dynamic> _$ThumbModelToJson(ThumbModel instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'photo_34': instance.photo34,
      'photo_68': instance.photo68,
      'photo_135': instance.photo135,
      'photo_270': instance.photo270,
      'photo_300': instance.photo300,
      'photo_600': instance.photo600,
      'photo_1200': instance.photo1200,
    };
