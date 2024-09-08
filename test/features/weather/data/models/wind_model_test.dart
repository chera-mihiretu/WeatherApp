import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/models/wind_model.dart';
import 'package:weather/features/weather/domain/entities/wind_entity.dart';

import '../../../../test_data/test_data.dart';

void main() {
  test('Should be subclass of windModel', () {
    expect(TestData.windModel, isA<WindEntity>());
  });
  group('wind model test', () {
    test('Should return valid wind from json ', () {
      /// action
      final result = WindModel.fromJson(TestData.getWind());

      /// assert
      expect(result, TestData.windModel);
    });

    test('Should convert into valid wind entity', () {
      /// assert
      expect(TestData.windModel.toEntity(), TestData.windEntity);
    });

    test('Whenever empty json is given the model must be empty', () {
      final result = WindModel.fromJson(null);

      // assert
      expect(result, const WindModel());
    });
  });
}
