import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/home_entity.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends HomeEntity {
  const HomeModel({required super.title, required super.subtitle});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
