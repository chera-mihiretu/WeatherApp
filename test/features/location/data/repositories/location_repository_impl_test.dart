import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/cores/exceptions/exception.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/location/data/repositories/location_repository_impl.dart';

import '../../../../test_data/test_data.dart';
import '../../../../test_data/test_generator.mocks.dart';

void main() {
  late LocationRepositoryImpl locationRepositoryImpl;
  late MockLoacationDataSource mockLocationDataSource;
  setUp(() {
    mockLocationDataSource = MockLoacationDataSource();
    locationRepositoryImpl =
        LocationRepositoryImpl(loacationDataSource: mockLocationDataSource);
  });

  group('Failure', () {
    test('SHould return location failure', () async {
      when(mockLocationDataSource.getCurrentLocation())
          .thenThrow(LocationException(message: TestData.error));

      /// action
      final result = await locationRepositoryImpl.getCurrentLocation();

      /// assert
      expect(result, Left(LocationFailure(TestData.error)));
    });
  });

  test('SHould return location', () async {
    when(mockLocationDataSource.getCurrentLocation())
        .thenAnswer((_) async => TestData.locationModel);

    /// action
    final result = await locationRepositoryImpl.getCurrentLocation();

    /// assert
    expect(result, Right(TestData.locationEntity));
  });
}
