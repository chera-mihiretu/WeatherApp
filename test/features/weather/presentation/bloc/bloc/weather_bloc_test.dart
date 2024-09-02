import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';

import '../../../../../test_data/test_data.dart';
import '../../../../../test_data/test_generator.mocks.dart';

void main() {
  late WeatherBloc weatherBloc;
  late MockGetWeatherByCityNameUsecase mockGetWeatherByCityNameUsecase;
  late MockGetWeatherByAbsLocationUsecase mockGetWeatherByAbsLocationUsecase;
  setUp(() {
    mockGetWeatherByAbsLocationUsecase = MockGetWeatherByAbsLocationUsecase();
    mockGetWeatherByCityNameUsecase = MockGetWeatherByCityNameUsecase();
    weatherBloc = WeatherBloc(
        getWeatherByAbsLocationUsecase: mockGetWeatherByAbsLocationUsecase,
        getWeatherByCityNameUsecase: mockGetWeatherByCityNameUsecase);
  });
  group('getWeatherby city name', () {
    test('Weather initial should be weather initial', () {
      expect(weatherBloc.state, isA<WeatherInitial>());
    });

    blocTest<WeatherBloc, WeatherState>(
      'See if the loading are being emmited, and data are being returned ',
      build: () {
        when(mockGetWeatherByCityNameUsecase.execute(any))
            .thenAnswer((_) async => Right(TestData.fullWeatherEntity));
        return weatherBloc;
      },
      act: (bloc) =>
          bloc.add(GetWeatherByCiyNameEvent(cityName: TestData.cityName)),
      expect: () => [
        WeatherLoadingState(),
        WeatherLoadedState(fullWeatherEntity: TestData.fullWeatherEntity),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'See if the loading are being emmited, and errors are being displayed',
      build: () {
        when(mockGetWeatherByCityNameUsecase.execute(any))
            .thenAnswer((_) async => Left(ServerFailure(TestData.error)));
        return weatherBloc;
      },
      act: (bloc) =>
          bloc.add(GetWeatherByCiyNameEvent(cityName: TestData.cityName)),
      expect: () => [
        WeatherLoadingState(),
        WeatherErrorState(message: TestData.error),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'See if the loading are being emmited',
      build: () {
        when(mockGetWeatherByAbsLocationUsecase.execute(any))
            .thenAnswer((_) async => Right(TestData.fullWeatherEntity));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(GetWeatherByAbsLocationEvent(
          lon: TestData.coordinateEntity.lon,
          lat: TestData.coordinateEntity.lat)),
      expect: () => [
        WeatherLoadingState(),
        WeatherLoadedState(fullWeatherEntity: TestData.fullWeatherEntity)
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'See if the loading are being emmited',
      build: () {
        when(mockGetWeatherByAbsLocationUsecase.execute(any))
            .thenAnswer((_) async => Left(ServerFailure(TestData.error)));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(GetWeatherByAbsLocationEvent(
          lon: TestData.coordinateEntity.lon,
          lat: TestData.coordinateEntity.lat)),
      expect: () =>
          [WeatherLoadingState(), WeatherErrorState(message: TestData.error)],
    );
  });
}
