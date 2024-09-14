import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_by_abs_location_usecase.dart';

import '../../../../test_data/test_data.dart';
import '../../../../test_data/test_generator.mocks.dart';

void main() {
  late MockGetWeatherRepository mockGetWeatherRepository;
  late GetWeatherByAbsLocationUsecase getWeatherByAbsLocationUsecase;
  setUp(() {
    mockGetWeatherRepository = MockGetWeatherRepository();
    getWeatherByAbsLocationUsecase = GetWeatherByAbsLocationUsecase(
        getWeatherRepository: mockGetWeatherRepository);
  });

  test('Data must move clealry', () async {
    /// arrange
    when(mockGetWeatherRepository.getWeatherByAbsoluteLocation(any))
        .thenAnswer((_) async => Right(TestData.fullWeatherEntity));

    /// action
    final result =
        await getWeatherByAbsLocationUsecase.execute(TestData.coordinateEntity);

    /// assert
    expect(result, Right(TestData.fullWeatherEntity));
  });

  test('Server failure must be handeled clealry', () async {
    /// arrange
    when(mockGetWeatherRepository.getWeatherByAbsoluteLocation(any))
        .thenAnswer((_) async => Left(ServerFailure(TestData.error)));

    /// action
    final result =
        await getWeatherByAbsLocationUsecase.execute(TestData.coordinateEntity);

    /// assert
    expect(result, Left(ServerFailure(TestData.error)));
  });

  test('cache failure must be handeled', () async {
    /// arrange
    when(mockGetWeatherRepository.getWeatherByAbsoluteLocation(any))
        .thenAnswer((_) async => Left(CacheFailure(TestData.error)));

    /// action
    final result =
        await getWeatherByAbsLocationUsecase.execute(TestData.coordinateEntity);

    /// assert
    expect(result, Left(CacheFailure(TestData.error)));
  });
}
