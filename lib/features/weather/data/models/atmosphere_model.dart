import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/features/weather/domain/entities/atmosphere_entity.dart';

part 'atmosphere_model.g.dart';

@HiveType(typeId: 1)
class AtmosphereModel extends AtmosphereEntity {
  @override
  @HiveField(0)
  // ignore: overridden_fields
  final double temp;
  @override
  @HiveField(1)
  // ignore: overridden_fields
  final double tempMin;
  @override
  @HiveField(2)
  // ignore: overridden_fields
  final double tempMax;
  @override
  @HiveField(3)
  // ignore: overridden_fields
  final double pressure;
  @override
  @HiveField(4)
  // ignore: overridden_fields
  final double humidity;
  @override
  @HiveField(5)
  // ignore: overridden_fields
  final double seaLevel;
  @override
  @HiveField(6)
  // ignore: overridden_fields
  final double grndLevel;

  const AtmosphereModel({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  }) : super(
          temp: temp,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity,
          seaLevel: seaLevel,
          grndLevel: grndLevel,
        );

  // Convert JSON to AtmosphereModel
  factory AtmosphereModel.fromJson(Map<String, dynamic> json) {
    return AtmosphereModel(
      temp: json['temp'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'].toDouble(),
      seaLevel: json['sea_level'].toDouble(),
      grndLevel: json['grnd_level'].toDouble(),
    );
  }

  // Convert AtmosphereModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
    };
  }

  AtmosphereEntity toEntity() {
    return AtmosphereEntity(
        temp: temp,
        tempMin: tempMin,
        tempMax: tempMax,
        pressure: pressure,
        humidity: humidity,
        seaLevel: seaLevel,
        grndLevel: grndLevel);
  }
}
