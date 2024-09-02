import 'dart:math';

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
      throw CacheException(message: ExceptionErrors.dataNotFound);
    } else {
      return coordinateModel;
    }
  }

  @override
  int getLastTime() {
    final int? time = lastTime.get(AppData.coordinateStorage);
    if (time == null) {
      throw CacheException(message: ExceptionErrors.dataNotFound);
    } else {
      return time;
    }
  }

  @override
  FullWeatherModel getLoadedWeather() {
    FullWeatherModel? result = lastWeather.get(AppData.weatherStorage);
    if (result == null) {
      throw CacheException(message: ExceptionErrors.dataNotFound);
    } else {
      return result;
    }
  }

  @override
  bool saveCoordinate(CoordinateModel coord) {
    lastCoordinate.put(AppData.coordinateStorage, coord);
    return true;
  }

  @override
  bool saveDate() {
    int time = DateTime.now().millisecondsSinceEpoch;
    lastTime.put(AppData.timeStorage, time);

    return true;
  }

  @override
  bool saveWeather(FullWeatherModel weather) {
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

      double distance = sqrt((pow(longDifference, 2) + pow(latDifference, 2)));

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
