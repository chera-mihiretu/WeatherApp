import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/models/sys_model.dart';
import 'package:weather/features/weather/domain/entities/sys_entity.dart';

import '../../../../test_data/test_data.dart';

void main() {
  test('Should be subclass of SysModel', () {
    expect(TestData.sysModel, isA<SysEntity>());
  });
  group('Sys model test', () {
    test('Should return valid sys from json ', () {
      /// action
      final result = SysModel.fromJson(TestData.getSys());

      /// assert
      expect(result, TestData.sysModel);
    });

    test('Should convert into valid sys entity', () {
      /// assert
      expect(TestData.sysModel.toEntity(), TestData.sysEntity);
    });
  });
}
