import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:weather/cores/exceptions/exception.dart';
import 'package:weather/cores/exceptions/exception_errors.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/cores/network/network_info.dart';
import 'package:weather/features/weather/data/data_sources/local_weather_data_source.dart';
import 'package:weather/features/weather/data/data_sources/remote_weather_data_source.dart';
import 'package:weather/features/weather/data/models/coordinate_model.dart';

import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/get_weather_repository.dart';

class GetWeatherRepositoryImpl extends GetWeatherRepository {
  final RemoteWeatherDataSource remoteWeatherDataSource;
  final LocalWeatherDataSource localWeatherDataSource;
  final NetworkInfo networkInfo;

  GetWeatherRepositoryImpl({
    required this.remoteWeatherDataSource,
    required this.localWeatherDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, FullWeatherEntity>> getWeatherByAbsoluteLocation(
      CoordinateEntity coord) async {
    final connection = await networkInfo
        .isConnected; // to check if mobile is connected to data or not

    if (connection) {
      final bool shouldRelod = localWeatherDataSource.shouldRelod(
          CoordinateModel.fromEntity(
              coord)); // to tell if the api should be called or not
      if (shouldRelod) {
        try {
          final result = await remoteWeatherDataSource
              .getWeatherByAbsLocation(CoordinateModel.fromEntity(coord));

          await localWeatherDataSource.saveWeather(
              result); // will call all necessary finction internally

          return Right(result.toEntity());
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        }
      } else {
        final project = localWeatherDataSource.getLoadedWeather();

        return Right(project.toEntity());
      }
    } else {
      try {
        final result = localWeatherDataSource.getLoadedWeather();

        return Right(result.toEntity());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, FullWeatherEntity>> getWeatherByCityName(
      String cityName) async {
    final connection = await networkInfo.isConnected;
    if (connection) {
      try {
        log('[REPOSITORY IMPL WEATHER] getting data from remote');
        final result =
            await remoteWeatherDataSource.getWeatherByCityName(cityName);

        log('[REPOSITORY IMPL WEATHER] no problem during conversion');

        return Right(result.toEntity());
      } on ServerException catch (e) {
        log('[REPOSITORY IMPL WEATHER] ${e.message}');

        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(ServerFailure(ExceptionErrors.connectionError));
    }
  }
}
