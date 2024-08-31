import 'package:weather/features/weather/data/models/coordinate_model.dart';

class AppData {
  static const String baseUrl = 'BASE_URL';
  static const String apiKey = 'API_KEY';
  static String weatherByNameUrl(String url, String cityName, String apiKey) =>
      '$url?q=$cityName&appid=$apiKey';
  static String weatherByLongAndLat(
          String url, CoordinateModel coord, String apiKey) =>
      '$url?lat=${coord.lat}&lon=${coord.lon}&appid=$apiKey&units=metric';
  static const String timeStorage = 'TIME';
  static const String weatherStorage = 'WEATHER';
  static const String coordinateStorage = 'COORDINATE';

  static const String appName = 'Weather';
}
