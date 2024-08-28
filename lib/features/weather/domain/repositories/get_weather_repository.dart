import 'package:dartz/dartz.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';

abstract class GetWeatherRepository {
  Future<Either<Failure, FullWeatherEntity>> getWeatherByAbsoluteLocation(
      CoordinateEntity coord);
  Future<Either<Failure, FullWeatherEntity>> getWeatherByCityName(
      String cityName);
}
