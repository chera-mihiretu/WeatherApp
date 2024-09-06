import 'dart:developer';
import 'dart:math' as math;
import 'package:hive/hive.dart';
import 'package:weather/cores/constants/constants.dart';
import 'package:weather/cores/exceptions/exception.dart';
import 'package:weather/cores/exceptions/exception_errors.dart';
import 'package:weather/features/weather/data/models/coordinate_model.dart';
import 'package:weather/features/weather/data/models/full_weather_model.dart';

abstract class LocalWeatherDataSource {
  //! getting datas
  FullWeatherModel getLoadedWeather();
  CoordinateModel getLastCoordinate();
  int getLastTime();
  //! Setting datas
  bool saveWeather(FullWeatherModel weather);
  bool saveDate();
  bool saveCoordinate(CoordinateModel coord);
  //! calculation of relod
  bool shouldRelod(CoordinateModel coord);
}

class LocalWeatherDataSourceImpl extends LocalWeatherDataSource {
  final Box<int> lastTime;
  final Box<CoordinateModel> lastCoordinate;
  final Box<FullWeatherModel> lastWeather;

  LocalWeatherDataSourceImpl({
    required this.lastTime,
    required this.lastCoordinate,
    required this.lastWeather,
  });

  @override
  CoordinateModel getLastCoordinate() {
    final CoordinateModel? coordinateModel =
        lastCoordinate.get(AppData.coordinateStorage);
    if (coordinateModel == null) {
      log('[LOCAL DATA SOURCE] -> No coordinate found');
      throw CacheException(message: ExceptionErrors.dataNotFound);
    } else {
      return coordinateModel;
    }
  }

  @override
  int getLastTime() {
    final int? time = lastTime.get(AppData.coordinateStorage);
    if (time == null) {
      log('[LOCAL DATA SOURCE] -> No time found');
      throw CacheException(message: ExceptionErrors.dataNotFound);
    } else {
      return time;
    }
  }

  @override
  FullWeatherModel getLoadedWeather() {
    FullWeatherModel? result = lastWeather.get(AppData.weatherStorage);
    if (result == null) {
      log('[LOCAL DATA SOURCE] -> No weather found');
      throw CacheException(message: ExceptionErrors.dataNotFound);
    } else {
      return result;
    }
  }

  @override
  bool saveCoordinate(CoordinateModel coord) {
    log('[LOCAL DATA SOURCE] -> coordinate saved');
    lastCoordinate.put(AppData.coordinateStorage, coord);
    return true;
  }

  @override
  bool saveDate() {
    log('[LOCAL DATA SOURCE] -> time saved');

    int time = DateTime.now().millisecondsSinceEpoch;
    lastTime.put(AppData.timeStorage, time);

    return true;
  }

  @override
  bool saveWeather(FullWeatherModel weather) {
    log('[LOCAL DATA SOURCE] -> weather saved');

    lastWeather.put(AppData.weatherStorage, weather);

    saveCoordinate(weather.coordinateModel);
    saveDate();
    return true;
  }

  @override
  bool shouldRelod(CoordinateModel coord) {
    late int time;
    late CoordinateModel coordinateModel;
    try {
      time = getLastTime();
      coordinateModel = getLastCoordinate();

      bool answer = false;
      double longDifference = (coord.lon - coordinateModel.lon).abs();
      double latDifference = (coord.lat - coordinateModel.lat).abs();

      double distance =
          math.sqrt((math.pow(longDifference, 2) + math.pow(latDifference, 2)));

      if (distance > 0.28) {
        answer = true;
      }

      int difference = DateTime.now().millisecondsSinceEpoch - time;
      Duration diffInDur = Duration(milliseconds: difference);
      if (diffInDur >= const Duration(minutes: 30)) {
        answer = true;
      }

      return answer;
    } on CacheException {
      return true;
    }
  }
}
