import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

import '../../../../test_data/test_data.dart';

void main() {
  test('Should be subclass of Weather', () {
    expect(TestData.weatherModel, isA<WeatherEntity>());
  });
  group('Coordinate model test', () {
    test('Should return valid Weather from json ', () {
      /// action
      final result = WeatherModel.fromJson(TestData.getWeather()[0]);

      /// assert
      expect(result, TestData.weatherModel);
    });

    test('Should convert into valid weather entity', () {
      /// assert
      expect(TestData.weatherModel.toEntity(), TestData.weatherEntity);
    });

    test('Should return valid list of weather model', () {
      final result = WeatherModel.fromJsonList(TestData.getWeather());

      expect(result, [TestData.weatherModel]);
    });

    test('Should convert the list of model into list of entity', () {
      final result = WeatherModel.toEntityList([TestData.weatherModel]);

      expect(result, [TestData.weatherEntity]);
    });
  });
}
