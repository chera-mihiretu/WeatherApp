import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/features/weather/data/models/coordinate_model.dart';
import 'package:weather/features/weather/data/models/sys_model.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/data/models/wind_model.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';

part 'full_weather_model.g.dart';

@HiveType(typeId: 6)
class FullWeatherModel extends FullWeatherEntity {
  // ignore: overridden_fields
  @HiveField(0)
  final CoordinateModel coordinateModel;
  // ignore: overridden_fields
  @HiveField(1)
  final List<WeatherModel> weatherModels;
  @override
  @HiveField(2)
  // ignore: overridden_fields
  final double visiblity;
  @HiveField(3)
  // ignore: overridden_fields
  final WindModel windModel;
  @HiveField(4)
  // ignore: overridden_fields
  final SysModel sysModel;
  @override
  @HiveField(5)
  // ignore: overridden_fields
  final String name;
  const FullWeatherModel({
    required this.coordinateModel,
    required this.weatherModels,
    required this.visiblity,
    required this.windModel,
    required this.sysModel,
    required this.name,
  }) : super(
          coordinateEntity: coordinateModel,
          weatherEntity: weatherModels,
          visiblity: visiblity,
          windEntity: windModel,
          sysEntity: sysModel,
          name: name,
        );
  factory FullWeatherModel.fromJson(Map<String, dynamic> json) {
    return FullWeatherModel(
      coordinateModel: CoordinateModel.fromJson(json['coord']),
      weatherModels: WeatherModel.fromJsonList(json['weather']),
      visiblity: json['visibility'].toDouble(),
      windModel: WindModel.fromJson(json['wind']),
      sysModel: SysModel.fromJson(json['sys']),
      name: json['name'],
    );
  }

  FullWeatherEntity toEntity() {
    return FullWeatherEntity(
        coordinateEntity: coordinateModel.toEntity(),
        weatherEntity: weatherModels.map((model) => model.toEntity()).toList(),
        visiblity: visiblity,
        windEntity: windModel.toEntity(),
        sysEntity: sysModel.toEntity(),
        name: name);
  }
}
