import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:weather/cores/env_data_loader.dart';
import 'package:weather/cores/network/network_info.dart';
import 'package:weather/features/weather/data/data_sources/local_weather_data_source.dart';
import 'package:weather/features/weather/data/data_sources/remote_weather_data_source.dart';
import 'package:weather/features/weather/domain/repositories/get_weather_repository.dart';

@GenerateMocks(
  [
    GetWeatherRepository,
    InternetConnectionChecker,
    RemoteWeatherDataSource,
    NetworkInfo,
    LocalWeatherDataSource,
    EnvDataLoader,
    Box,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
