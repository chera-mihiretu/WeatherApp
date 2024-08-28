import 'package:weather/features/weather/domain/entities/sys_entity.dart';

class SysModel extends SysEntity {
  @override
  // ignore: overridden_fields
  final String country;
  @override
  // ignore: overridden_fields
  final DateTime sunrise;
  @override
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
