import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/models/coordinate_model.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';

import '../../../../test_data/test_data.dart';

void main() {
  test('Should be subclass of CoordModel', () {
    expect(TestData.coordinateModel, isA<CoordinateEntity>());
  });
  group('Coordinate model test', () {
    test('Should return valid coordinate from json ', () {
      /// action
      final result = CoordinateModel.fromJson(TestData.getCoord());

      /// assert
      expect(result, TestData.coordinateModel);
    });

    test('Should convert into valid coord entity', () {
      /// assert
      expect(TestData.coordinateModel.toEntity(), TestData.coordinateEntity);
    });
  });
}
