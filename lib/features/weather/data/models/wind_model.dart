import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/features/weather/domain/entities/wind_entity.dart';

part 'wind_model.g.dart';

@HiveType(typeId: 5)
class WindModel extends WindEntity {
  @override
  @HiveField(0)
  // ignore: overridden_fields
  final double? speed;
  @override
  @HiveField(1)
  // ignore: overridden_fields
  final double? deg;
  @override
  @HiveField(2)
  // ignore: overridden_fields
  final double? gust;

  const WindModel({
    this.speed,
    this.deg,
    this.gust,
  }) : super(
          speed: speed,
          deg: deg,
          gust: gust,
        );

  // Convert JSON to WindModel
  factory WindModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const WindModel();
    return WindModel(
      speed: json['speed'].toDouble(),
      deg: json['deg'].toDouble(),
      gust: json['gust'].toDouble(),
    );
  }

  // Convert WindModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  WindEntity toEntity() {
    return WindEntity(
      speed: speed,
      deg: deg,
      gust: gust,
    );
  }
}
