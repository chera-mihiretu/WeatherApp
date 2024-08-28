import 'package:dartz/dartz.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/weather/data/data_sources/remote_weather_data_source.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/get_weather_repository.dart';

class GetWeatherRepositoryImpl extends GetWeatherRepository {
  final RemoteWeatherDataSource remoteWeatherDataSource;

  GetWeatherRepositoryImpl({required this.remoteWeatherDataSource});

  @override
  Future<Either<Failure, FullWeatherEntity>> getWeatherByAbsoluteLocation(
      CoordinateEntity coord) {
    // TODO: implement getWeatherByAbsoluteLocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FullWeatherEntity>> getWeatherByCityName(
      String cityName) {
    // TODO: implement getWeatherByCityName
    throw UnimplementedError();
  }
}
