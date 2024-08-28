import 'dart:convert';
import 'dart:io';

import 'package:weather/features/weather/data/models/atmosphere_model.dart';
import 'package:weather/features/weather/data/models/coordinate_model.dart';
import 'package:weather/features/weather/data/models/full_weather_model.dart';
import 'package:weather/features/weather/data/models/sys_model.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/data/models/wind_model.dart';
import 'package:weather/features/weather/domain/entities/atmosphere_entity.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/domain/entities/sys_entity.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/entities/wind_entity.dart';

class TestData {
  //! Weather model
  static WeatherEntity weatherEntity = WeatherEntity(
    id: 804,
    main: 'Clouds',
    description: 'overcast clouds',
    icon: '04d',
  );

  static WeatherModel weatherModel = WeatherModel(
    id: 804,
    main: 'Clouds',
    description: 'overcast clouds',
    icon: '04d',
  );
  //! Atmosphere data
  static const AtmosphereModel atmosphereModel = AtmosphereModel(
    temp: 24.58,
    tempMin: 24.58,
    tempMax: 24.58,
    pressure: 1014,
    humidity: 52,
    seaLevel: 1014,
    grndLevel: 845,
  );

  static const AtmosphereEntity atmosphereEntity = AtmosphereEntity(
    temp: 24.58,
    tempMin: 24.58,
    tempMax: 24.58,
    pressure: 1014,
    humidity: 52,
    seaLevel: 1014,
    grndLevel: 845,
  );

  //!  Coordinate data
  static const CoordinateModel coordinateModel = CoordinateModel(
    lon: 39.2705,
    lat: 8.541,
  );

  static const CoordinateEntity coordinateEntity = CoordinateEntity(
    lon: 39.2705,
    lat: 8.541,
  );

  //! Sys Model data

  static SysModel sysModel = SysModel(
    country: 'ET',
    sunrise: DateTime.fromMillisecondsSinceEpoch(1724814905 * 1000),
    sunset: DateTime.fromMillisecondsSinceEpoch(1724859213 * 1000),
  );

  static SysEntity sysEntity = SysEntity(
    country: 'ET',
    sunrise: DateTime.fromMillisecondsSinceEpoch(1724814905 * 1000),
    sunset: DateTime.fromMillisecondsSinceEpoch(1724859213 * 1000),
  );

  //! Wind data

  static const WindModel windModel = WindModel(
    speed: 6.39,
    deg: 234,
    gust: 7.66,
  );

  static const WindEntity windEntity = WindEntity(
    speed: 6.39,
    deg: 234,
    gust: 7.66,
  );

  //! Full Weather
  static FullWeatherModel fullWeatherModel = FullWeatherModel(
    coordinateModel: coordinateModel,
    weatherModels: [weatherModel],
    visiblity: 10000,
    windModel: windModel,
    sysModel: sysModel,
    name: 'Nazrēt',
  );
  static FullWeatherEntity fullWeatherEntity = FullWeatherEntity(
    coordinateEntity: coordinateModel,
    weatherEntity: [weatherModel],
    visiblity: 10000,
    windEntity: windModel,
    sysEntity: sysModel,
    name: 'Nazrēt',
  );
  //!======================================================//
  //!                Readed Datas                          //
  //!======================================================//

  static String readJson() {
    String dir = Directory.current.path;

    dir = '$dir/test/test_data/weather_responce.json';
    return File(dir).readAsStringSync();
  }

  static List<dynamic> getWeather() {
    final result = json.decode(readJson());
    return result['weather'];
  }

  static Map<String, dynamic> getWind() {
    final result = json.decode(readJson());
    return result['wind'];
  }

  static Map<String, dynamic> getSys() {
    final result = json.decode(readJson());
    return result['sys'];
  }

  static Map<String, dynamic> getAtmosphere() {
    final result = json.decode(readJson());
    return result['main'];
  }

  static Map<String, dynamic> getCoord() {
    final result = json.decode(readJson());
    return result['coord'];
  }

  static Map<String, dynamic> getAll() {
    return json.decode(readJson());
  }
}

void main() {
  final result = TestData.getAtmosphere();
  print(result);
}
