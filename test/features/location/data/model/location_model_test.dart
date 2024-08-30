import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/features/location/data/model/location_model.dart';

import '../../../../test_data/test_data.dart';

void main() {
  test('Should convert from position perfectly', () {
    final LocationModel result = LocationModel.fromPosition(Position(
      longitude: 39.2705,
      latitude: 8.541,
      timestamp: DateTime.now(),
      accuracy: 10,
      altitude: 10,
      altitudeAccuracy: 10,
      heading: 10,
      headingAccuracy: 10,
      speed: 10,
      speedAccuracy: 10,
    ));

    expect(result, TestData.locationModel);
  });

  test('Should convert to entity', () {
    expect(TestData.locationModel.toEntity(), TestData.locationEntity);
  });
}
