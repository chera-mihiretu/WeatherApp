import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/features/weather/domain/entities/sys_entity.dart';

part 'sys_model.g.dart';

@HiveType(typeId: 2)
class SysModel extends SysEntity {
  @override
  @HiveField(0)
  // ignore: overridden_fields
  final String country;
  @override
  @HiveField(1)
  // ignore: overridden_fields
  final DateTime sunrise;
  @override
  @HiveField(2)
  // ignore: overridden_fields
  final DateTime sunset;

  const SysModel({
    required this.country,
    required this.sunrise,
    required this.sunset,
  }) : super(
          country: country,
          sunrise: sunrise,
          sunset: sunset,
        );

  // Convert JSON to SysModel
  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      country: json['country'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000),
    );
  }

  // Convert SysModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  SysEntity toEntity() {
    return SysEntity(
      country: country,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}
