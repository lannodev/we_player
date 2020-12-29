import 'package:json_annotation/json_annotation.dart';

part 'ads_model.g.dart';

@JsonSerializable()
class AdsModel {
  @JsonKey(name: "content_id")
  final String contentId;
  final String duration;
  @JsonKey(name: "account_age_type")
  final String accountAgeType;
  final String puid1;
  final String puid22;

  AdsModel({
    this.contentId,
    this.duration,
    this.accountAgeType,
    this.puid1,
    this.puid22,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) => _$AdsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdsModelToJson(this);
}
