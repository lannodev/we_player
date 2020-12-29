// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsModel _$AdsModelFromJson(Map<String, dynamic> json) {
  return AdsModel(
    contentId: json['content_id'] as String,
    duration: json['duration'] as String,
    accountAgeType: json['account_age_type'] as String,
    puid1: json['puid1'] as String,
    puid22: json['puid22'] as String,
  );
}

Map<String, dynamic> _$AdsModelToJson(AdsModel instance) => <String, dynamic>{
      'content_id': instance.contentId,
      'duration': instance.duration,
      'account_age_type': instance.accountAgeType,
      'puid1': instance.puid1,
      'puid22': instance.puid22,
    };
