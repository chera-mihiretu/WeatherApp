import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/models/atmosphere_model.dart';
import 'package:weather/features/weather/data/models/full_weather_model.dart';
import 'package:weather/features/weather/domain/entities/atmosphere_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';

import '../../../../test_data/test_data.dart';

void main() {
  test('Should be subclass of fillweather', () {
    expect(TestData.fullWeatherEntity, isA<FullWeatherEntity>());
  });
  group('Atmosphere model test', () {
    test('Should return valid fullweather from json ', () {
      /// action
      final result = FullWeatherModel.fromJson(TestData.getAll());

      /// assert
      expect(result, TestData.fullWeatherModel);
    });

    test('Should convert into valid full_weather entity', () {
      /// assert
      expect(TestData.fullWeatherModel.toEntity(), TestData.fullWeatherEntity);
    });
  });
}
