import 'package:weather/features/weather/data/models/coordinate_model.dart';
import 'package:weather/features/weather/data/models/full_weather_model.dart';

abstract class RemoteWeatherDataSource {
  Future<FullWeatherModel> getWeatherByCityName(String cityName);
  Future<FullWeatherModel> getWeatherByAbsLocation(CoordinateModel coord);
}
