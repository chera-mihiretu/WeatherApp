import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/models/atmosphere_model.dart';
import 'package:weather/features/weather/domain/entities/atmosphere_entity.dart';

import '../../../../test_data/test_data.dart';

void main() {
  test('Should be subclass of AtmModel', () {
    expect(TestData.atmosphereModel, isA<AtmosphereEntity>());
  });
  group('Atmosphere model test', () {
    test('Should return valid atmosphere from json ', () {
      /// action
      final result = AtmosphereModel.fromJson(TestData.getAtmosphere());

      /// assert
      expect(result, TestData.atmosphereModel);
    });

    test('Should convert into valid atm entity', () {
      /// assert
      expect(TestData.atmosphereModel.toEntity(), TestData.atmosphereEntity);
    });
  });
}
