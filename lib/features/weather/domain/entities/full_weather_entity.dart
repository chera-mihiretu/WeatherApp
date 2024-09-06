import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entities/atmosphere_entity.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:weather/features/weather/domain/entities/sys_entity.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/entities/wind_entity.dart';

class FullWeatherEntity extends Equatable {
  final AtmosphereEntity atmEntity;
  final CoordinateEntity coordinateEntity;
  final List<WeatherEntity> weatherEntity;
  final double visiblity;
  final WindEntity windEntity;
  final SysEntity sysEntity;
  final String name;

  const FullWeatherEntity({
    required this.atmEntity,
    required this.coordinateEntity,
    required this.weatherEntity,
    required this.visiblity,
    required this.windEntity,
    required this.sysEntity,
    required this.name,
    required AtmosphereEntity atmModel,
  });
  @override
  List<Object?> get props => [
        coordinateEntity,
        weatherEntity,
        windEntity,
        sysEntity,
        name,
      ];
}
