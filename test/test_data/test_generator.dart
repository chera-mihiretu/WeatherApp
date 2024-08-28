import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:weather/features/weather/domain/repositories/get_weather_repository.dart';

@GenerateMocks(
  [
    GetWeatherRepository,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
