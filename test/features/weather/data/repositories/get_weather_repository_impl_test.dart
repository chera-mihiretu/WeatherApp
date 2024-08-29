import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/cores/exceptions/exception.dart';
import 'package:weather/cores/exceptions/exception_errors.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/weather/data/repositories/get_weather_repository_impl.dart';

import '../../../../test_data/test_data.dart';
import '../../../../test_data/test_generator.mocks.dart';

void main() {
  late GetWeatherRepositoryImpl getWeatherRepositoryImpl;
  late MockNetworkInfo mockNetworkInfo;
  late MockLocalWeatherDataSource mockLocalWeatherDataSource;
  late MockRemoteWeatherDataSource mockRemoteWeatherDataSource;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteWeatherDataSource = MockRemoteWeatherDataSource();
    mockLocalWeatherDataSource = MockLocalWeatherDataSource();
    getWeatherRepositoryImpl = GetWeatherRepositoryImpl(
      localWeatherDataSource: mockLocalWeatherDataSource,
      remoteWeatherDataSource: mockRemoteWeatherDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  // The following test are repository emplimentation test
  group('Repository while success on internet', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockLocalWeatherDataSource.shouldRelod(TestData.coordinateModel))
          .thenReturn(true);
      when(mockLocalWeatherDataSource.saveCoordinate(any)).thenReturn(true);
      when(mockLocalWeatherDataSource.saveDate()).thenReturn(true);
      when(mockLocalWeatherDataSource.saveWeather(any)).thenReturn(true);
    });

    group('Network info should be called and api also should be called', () {
      test('When get Weather by city name return data', () async {
        // arrange
        when(mockRemoteWeatherDataSource.getWeatherByCityName(any))
            .thenAnswer((_) async => TestData.fullWeatherModel);

        /// action
        final result = await getWeatherRepositoryImpl
            .getWeatherByCityName(TestData.cityName);

        /// assert
        expect(result, Right(TestData.fullWeatherEntity));
        verify(mockNetworkInfo.isConnected);
        verify(mockRemoteWeatherDataSource.getWeatherByCityName(any));
      });

      test('When get Weather by abs location return data', () async {
        // arrange
        when(mockRemoteWeatherDataSource.getWeatherByAbsLocation(any))
            .thenAnswer((_) async => TestData.fullWeatherModel);

        /// action
        final result = await getWeatherRepositoryImpl
            .getWeatherByAbsoluteLocation(TestData.coordinateEntity);

        /// assert
        expect(result, Right(TestData.fullWeatherEntity));
        verify(mockNetworkInfo.isConnected);
        verify(mockRemoteWeatherDataSource.getWeatherByAbsLocation(any));
      });
    });

    group('Should return failures when exception is thrown', () {
      test('When get Weather by city name return failure', () async {
        // arrange
        when(mockRemoteWeatherDataSource.getWeatherByCityName(any))
            .thenThrow(ServerException(message: TestData.error));

        /// action
        final result = await getWeatherRepositoryImpl
            .getWeatherByCityName(TestData.cityName);

        /// assert
        expect(result, Left(ServerFailure(TestData.error)));
        verify(mockNetworkInfo.isConnected);
        verify(mockRemoteWeatherDataSource.getWeatherByCityName(any));
      });

      test('When get Weather by abs location return failure', () async {
        // arrange
        when(mockRemoteWeatherDataSource.getWeatherByAbsLocation(any))
            .thenThrow(ServerException(message: TestData.error));

        /// action
        final result = await getWeatherRepositoryImpl
            .getWeatherByAbsoluteLocation(TestData.coordinateEntity);

        /// assert
        expect(result, Left(ServerFailure(TestData.error)));
        verify(mockNetworkInfo.isConnected);
        verify(mockRemoteWeatherDataSource.getWeatherByAbsLocation(any));
      });
    });
  });

  /// When there is no connection
  group('When there is no connnection', () {
    test('Should return server exception message', () async {
      /// arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      /// action
      final result = await getWeatherRepositoryImpl
          .getWeatherByCityName(TestData.cityName);

      /// assert
      expect(
          result, const Left(ServerFailure(ExceptionErrors.connectionError)));
    });
  });

  //! these where things get complecacated

  //! When there is no data connection and no local data
  test('Should return cash failure when there is no data an no local data',
      () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    when(mockLocalWeatherDataSource.getLoadedWeather())
        .thenThrow(CacheException(message: TestData.error));

    /// action
    final result = await getWeatherRepositoryImpl
        .getWeatherByAbsoluteLocation(TestData.coordinateEntity);

    /// expect
    expect(result, Left(CacheFailure(TestData.error)));
  });
  //! when there is no connection and when data should load and
  test(
      'Should return server failure when there is no enternet and data should also reload',
      () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockLocalWeatherDataSource.shouldRelod(any)).thenReturn(true);
    when(mockRemoteWeatherDataSource.getWeatherByAbsLocation(any))
        .thenThrow(ServerException(message: TestData.error));

    /// action
    final result = await getWeatherRepositoryImpl
        .getWeatherByAbsoluteLocation(TestData.coordinateEntity);

    /// expect
    expect(result, Left(ServerFailure(TestData.error)));
  });
  //! when there is no connection it should return data from local and also when it should not load
  group("Should not load and no connection", () {
    /// when there is no connection
    test('Should return data from local when there is no data', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalWeatherDataSource.getLoadedWeather())
          .thenReturn(TestData.fullWeatherModel);
      final result = await getWeatherRepositoryImpl
          .getWeatherByAbsoluteLocation(TestData.coordinateEntity);
      expect(result, Right(TestData.fullWeatherEntity));
    });

    test('Should return data from local when there is no need of reload',
        () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockLocalWeatherDataSource.shouldRelod(any)).thenReturn(false);
      when(mockLocalWeatherDataSource.getLoadedWeather())
          .thenReturn(TestData.fullWeatherModel);
      final result = await getWeatherRepositoryImpl
          .getWeatherByAbsoluteLocation(TestData.coordinateEntity);
      expect(result, Right(TestData.fullWeatherEntity));
    });
  });
}
