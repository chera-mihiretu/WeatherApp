import 'package:weather/features/weather/domain/entities/wind_entity.dart';

class WindModel extends WindEntity {
  final double speed;
  final double deg;
  final double gust;

  const WindModel({
    required this.speed,
    required this.deg,
    required this.gust,
  }) : super(
          speed: speed,
          deg: deg,
          gust: gust,
        );

  // Convert JSON to WindModel
  factory WindModel.fromJson(Map<String, dynamic> json) {
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
