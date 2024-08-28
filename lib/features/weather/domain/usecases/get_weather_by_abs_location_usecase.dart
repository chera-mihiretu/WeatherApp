import 'package:dartz/dartz.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/get_weather_repository.dart';

class GetWeatherByAbsLocationUsecase {
  final GetWeatherRepository getWeatherRepository;

  GetWeatherByAbsLocationUsecase({required this.getWeatherRepository});

  Future<Either<Failure, FullWeatherEntity>> execute(
      CoordinateEntity coord) async {
    return await getWeatherRepository.getWeatherByAbsoluteLocation(coord);
  }
}
