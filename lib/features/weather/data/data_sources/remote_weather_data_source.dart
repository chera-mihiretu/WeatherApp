import 'dart:convert';
import 'dart:io';

import 'package:weather/cores/constants/constants.dart';
import 'package:weather/cores/env_data_loader.dart';
import 'package:weather/cores/exceptions/exception.dart';
import 'package:weather/cores/exceptions/exception_errors.dart';
import 'package:weather/features/weather/data/models/coordinate_model.dart';
import 'package:weather/features/weather/data/models/full_weather_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteWeatherDataSource {
  Future<FullWeatherModel> getWeatherByCityName(String cityName);
  Future<FullWeatherModel> getWeatherByAbsLocation(CoordinateModel coord);
}

class RemoteWeatherDataSourceImpl extends RemoteWeatherDataSource {
  final http.Client client;
  final EnvDataLoader envDataLoader;

  RemoteWeatherDataSourceImpl(
      {required this.client, required this.envDataLoader});

  @override
  Future<FullWeatherModel> getWeatherByAbsLocation(
      CoordinateModel coord) async {
    final String? apiKey = await envDataLoader.getApiKey();
    final String? baseUrl = await envDataLoader.getBaseUrl();

    if (apiKey != null && baseUrl != null) {
      try {
        final String url = AppData.weatherByLongAndLat(baseUrl, coord, apiKey);
        final result = await client
            .get(Uri.parse(url))
            .timeout(const Duration(seconds: 20));
        final mapResult = json.decode(result.body);

        if (result.statusCode == 200) {
          return FullWeatherModel.fromJson(mapResult);
        } else {
          throw ServerException(message: mapResult['message']);
        }
      } on SocketException {
        throw ServerException(message: ExceptionErrors.connectionError);
      } on ServerException {
        rethrow;
      } on Exception {
        throw UnkownException(message: ExceptionErrors.unkownError);
      }
    } else {
      throw InvalidUrlException(message: ExceptionErrors.invalidUrl);
    }
  }

  @override
  Future<FullWeatherModel> getWeatherByCityName(String cityName) async {
    final String? apiKey = await envDataLoader.getApiKey();
    final String? baseUrl = await envDataLoader.getBaseUrl();

    if (apiKey != null && baseUrl != null) {
      try {
        final String url = AppData.weatherByNameUrl(baseUrl, cityName, apiKey);
        final result = await client
            .get(Uri.parse(url))
            .timeout(const Duration(seconds: 20));
        final mapResult = json.decode(result.body);

        if (result.statusCode == 200) {
          return FullWeatherModel.fromJson(mapResult);
        } else {
          throw ServerException(message: mapResult['message']);
        }
      } on SocketException {
        throw ServerException(message: ExceptionErrors.connectionError);
      } on ServerException {
        rethrow;
      } on Exception {
        throw UnkownException(message: ExceptionErrors.unkownError);
      }
    } else {
      throw InvalidUrlException(message: ExceptionErrors.invalidUrl);
    }
  }
}
