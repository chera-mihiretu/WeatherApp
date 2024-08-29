import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/cores/exceptions/exception.dart';
import 'package:weather/features/weather/data/data_sources/remote_weather_data_source.dart';
import 'package:http/http.dart' as http;
import '../../../../test_data/test_data.dart';
import '../../../../test_data/test_generator.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late MockEnvDataLoader mockEnvDataLoader;
  late RemoteWeatherDataSourceImpl remoteWeatherDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockEnvDataLoader = MockEnvDataLoader();
    remoteWeatherDataSourceImpl = RemoteWeatherDataSourceImpl(
        client: mockHttpClient, envDataLoader: mockEnvDataLoader);
  });

  group('Get Weather by coordination', () {
    test('Should return valid data when api responces', () async {
      /// assert
      when(mockHttpClient.get(any)).thenAnswer((_) async =>
          http.Response(TestData.readJson(), 200, headers: TestData.header));
      when(mockEnvDataLoader.getApiKey())
          .thenAnswer((_) async => TestData.apiKey);
      when(mockEnvDataLoader.getBaseUrl())
          .thenAnswer((_) async => TestData.baseUrl);

      /// action
      final result = await remoteWeatherDataSourceImpl
          .getWeatherByAbsLocation(TestData.coordinateModel);

      /// assert
      expect(result, TestData.fullWeatherModel);
    });

    test('Should return server error and message when status code is not 200',
        () async {
      /// assert
      when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response(
          '{"code": 200, "message": "${TestData.error}"}', 404,
          headers: TestData.header));
      when(mockEnvDataLoader.getApiKey())
          .thenAnswer((_) async => TestData.apiKey);
      when(mockEnvDataLoader.getBaseUrl())
          .thenAnswer((_) async => TestData.baseUrl);

      /// action
      final result = remoteWeatherDataSourceImpl.getWeatherByAbsLocation;

      /// assert
      expect(() async => result(TestData.coordinateModel),
          throwsA(isA<ServerException>()));
    });

    test('Should return server error and message when status code is not 200',
        () async {
      /// assert
      when(mockHttpClient.get(any))
          .thenThrow(ServerException(message: TestData.error));
      when(mockEnvDataLoader.getApiKey())
          .thenAnswer((_) async => TestData.apiKey);
      when(mockEnvDataLoader.getBaseUrl())
          .thenAnswer((_) async => TestData.baseUrl);

      /// action
      final result = remoteWeatherDataSourceImpl.getWeatherByAbsLocation;

      /// assert
      expect(() async => result(TestData.coordinateModel),
          throwsA(isA<ServerException>()));
    });
  });

  //! get weather by city name
  group('get weather by city Name', () {
    test('Should return valid data when api responces', () async {
      /// assert
      when(mockHttpClient.get(any)).thenAnswer((_) async =>
          http.Response(TestData.readJson(), 200, headers: TestData.header));
      when(mockEnvDataLoader.getApiKey())
          .thenAnswer((_) async => TestData.apiKey);
      when(mockEnvDataLoader.getBaseUrl())
          .thenAnswer((_) async => TestData.baseUrl);

      /// action
      final result = await remoteWeatherDataSourceImpl
          .getWeatherByCityName(TestData.cityName);

      /// assert
      expect(result, TestData.fullWeatherModel);
    });

    test('Should return server error and message when status code is not 200',
        () async {
      /// assert
      when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response(
          '{"code": 200, "message": "${TestData.error}"}', 404,
          headers: TestData.header));
      when(mockEnvDataLoader.getApiKey())
          .thenAnswer((_) async => TestData.apiKey);
      when(mockEnvDataLoader.getBaseUrl())
          .thenAnswer((_) async => TestData.baseUrl);

      /// action
      final result = remoteWeatherDataSourceImpl.getWeatherByCityName;

      /// assert
      expect(() async => result(TestData.cityName),
          throwsA(isA<ServerException>()));
    });

    test('Should return server error and message when status code is not 200',
        () async {
      /// assert
      when(mockHttpClient.get(any))
          .thenThrow(ServerException(message: TestData.error));
      when(mockEnvDataLoader.getApiKey())
          .thenAnswer((_) async => TestData.apiKey);
      when(mockEnvDataLoader.getBaseUrl())
          .thenAnswer((_) async => TestData.baseUrl);

      /// action
      final result = remoteWeatherDataSourceImpl.getWeatherByCityName;

      /// assert
      expect(() async => result(TestData.cityName),
          throwsA(isA<ServerException>()));
    });
  });
}
