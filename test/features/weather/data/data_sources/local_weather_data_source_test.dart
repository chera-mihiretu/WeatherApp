import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/features/weather/data/data_sources/local_weather_data_source.dart';
import 'package:weather/features/weather/data/models/coordinate_model.dart';
import 'package:weather/features/weather/data/models/full_weather_model.dart';

import '../../../../test_data/test_data.dart';
import '../../../../test_data/test_generator.mocks.dart';

void main() {
  late MockBox<FullWeatherModel> weatherLocal;
  late MockBox<CoordinateModel> coordinateLocal;
  late MockBox<int> timeLocal;
  late LocalWeatherDataSourceImpl localWeatherDataSourceImpl;

  setUp(() {
    weatherLocal = MockBox();
    coordinateLocal = MockBox();
    timeLocal = MockBox();

    localWeatherDataSourceImpl = LocalWeatherDataSourceImpl(
      lastTime: timeLocal,
      lastCoordinate: coordinateLocal,
      lastWeather: weatherLocal,
    );
  });

  group("Test to check if the algorithm works perfectly", () {
    test('Should return true when the app needs to be reloaded ', () {
      /// assert
      when(timeLocal.get(any))
          .thenReturn(DateTime.now().millisecondsSinceEpoch - 180000);
      when(coordinateLocal.get(any)).thenReturn(TestData.coordinateModel);
      when(weatherLocal.get(any)).thenReturn(TestData.fullWeatherModel);

      /// action
      final result =
          localWeatherDataSourceImpl.shouldRelod(TestData.coordinateModel);

      /// assert
      expect(result, false);
    });

    test('Should return false when the app needs not to be reloaded ', () {
      /// assert
      when(timeLocal.get(any))
          .thenReturn(DateTime.now().millisecondsSinceEpoch - 18000000);
      when(coordinateLocal.get(any)).thenReturn(TestData.coordinateModel);
      when(weatherLocal.get(any)).thenReturn(TestData.fullWeatherModel);

      /// action
      final result =
          localWeatherDataSourceImpl.shouldRelod(TestData.coordinateModel);

      /// assert
      expect(result, true);
    });

    test('Should return true when the coordinate change is more than distance',
        () {
      /// assert
      when(timeLocal.get(any))
          .thenReturn(DateTime.now().millisecondsSinceEpoch);
      when(coordinateLocal.get(any)).thenReturn(CoordinateModel(
          lon: TestData.coordinateModel.lon - .3,
          lat: TestData.coordinateModel.lat - .3));
      when(weatherLocal.get(any)).thenReturn(TestData.fullWeatherModel);

      /// action
      final result =
          localWeatherDataSourceImpl.shouldRelod(TestData.coordinateModel);

      /// assert
      expect(result, true);
    });

    test('Should return false when the coordinate change is less than distance',
        () {
      /// assert
      when(timeLocal.get(any))
          .thenReturn(DateTime.now().millisecondsSinceEpoch);
      when(coordinateLocal.get(any)).thenReturn(CoordinateModel(
          lon: TestData.coordinateModel.lon - .1,
          lat: TestData.coordinateModel.lat - .1));
      when(weatherLocal.get(any)).thenReturn(TestData.fullWeatherModel);

      /// action
      final result =
          localWeatherDataSourceImpl.shouldRelod(TestData.coordinateModel);

      /// assert
      expect(result, false);
    });
  });
}
