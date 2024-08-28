import 'package:dartz/dartz.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/get_weather_repository.dart';

class GetWeatherByCityNameUsecase {
  final GetWeatherRepository getWeatherRepository;

  GetWeatherByCityNameUsecase({required this.getWeatherRepository});

  Future<Either<Failure, FullWeatherEntity>> execute(String cityName) async {
    return await getWeatherRepository.getWeatherByCityName(cityName);
  }
}
