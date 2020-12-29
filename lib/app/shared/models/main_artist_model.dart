import 'package:json_annotation/json_annotation.dart';

part 'main_artist_model.g.dart';

@JsonSerializable()
class MainArtistModel {
  final String name;
  final String domain;
  final String id;

  MainArtistModel({
    this.name,
    this.domain,
    this.id,
  });

  factory MainArtistModel.fromJson(Map<String, dynamic> json) => _$MainArtistModelFromJson(json);
  Map<String, dynamic> toJson() => _$MainArtistModelToJson(this);
}
