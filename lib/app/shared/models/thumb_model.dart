import 'package:json_annotation/json_annotation.dart';

part 'thumb_model.g.dart';

@JsonSerializable()
class ThumbModel {
  final int width;
  final int height;
  @JsonKey(name: "photo_34")
  final String photo34;
  @JsonKey(name: "photo_68")
  final String photo68;
  @JsonKey(name: "photo_135")
  final String photo135;
  @JsonKey(name: "photo_270")
  final String photo270;
  @JsonKey(name: "photo_300")
  final String photo300;
  @JsonKey(name: "photo_600")
  final String photo600;
  @JsonKey(name: "photo_1200")
  final String photo1200;

  ThumbModel({
    this.width,
    this.height,
    this.photo34,
    this.photo68,
    this.photo135,
    this.photo270,
    this.photo300,
    this.photo600,
    this.photo1200,
  });

  factory ThumbModel.fromJson(Map<String, dynamic> json) => _$ThumbModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbModelToJson(this);
}
