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

  static const String timeStorageBox = 'TIMEBOX';
  static const String weatherStorageBox = 'WEATHERBOX';
  static const String coordinateStorageBox = 'COORDINATEBOX';

  static const String appName = 'Weather';

  static const String sunIcon = 'assets/icons/sun.png';
  static const String cloudIcon = 'assets/icons/cloud.png';
  static const String rainSunIcon = 'assets/icons/shower_day.png';
  static const String sunCloudIcon = 'assets/icons/partially_cloud.png';
  static const String rainThunderIcon = 'assets/icons/rain_thunder.png';
  static const String rainIcon = 'assets/icons/rainy.png';
  static const String snowIcon = 'assets/icons/ice.png';
  static const String mistIcon = 'assets/icons/cloud.png';
  static const Map<String, String> cloudCodePairedWithImage = {
    '01d': sunIcon,
    '02d': sunIcon, // few clouds
    '03d': sunCloudIcon, // Scattared clouds
    '04d': sunCloudIcon, // Broken clouds
    '09d': rainSunIcon, // ShowerDay
    '10d': rainIcon,
    '11d': rainThunderIcon,
    '13d': snowIcon,
    '14d': mistIcon
  };

  static String getIconImage(String iconCode) {
    final result = cloudCodePairedWithImage[iconCode];
    if (result == null) {
      return sunCloudIcon;
    } else {
      return result;
    }
  }
}
