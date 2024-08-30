import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/location/presentation/bloc/location_bloc.dart';

import '../../../../test_data/test_data.dart';
import '../../../../test_data/test_generator.mocks.dart';

void main() {
  late LocationBloc locationBloc;
  late MockGetLocationUseCase mockGetLocationUseCase;

  setUp(() {
    mockGetLocationUseCase = MockGetLocationUseCase();
    locationBloc = LocationBloc(getLocationUseCase: mockGetLocationUseCase);
  });

  test('Should be in initial state', () {
    expect(locationBloc.state, isA<LocationInitial>());
  });

  group('Location test', () {
    // arrange
    blocTest<LocationBloc, LocationState>(
      'Should return valid location when permited',
      build: () {
        when(mockGetLocationUseCase.execute())
            .thenAnswer((_) async => Right(TestData.locationEntity));
        return locationBloc;
      },
      act: (bloc) => bloc.add(GetLocationEvent()),
      expect: () => [
        LocationLoadingState(),
        LocationLoadedState(locationEntity: TestData.locationEntity)
      ],
    );

    blocTest<LocationBloc, LocationState>(
      'Should return valid location when permited',
      build: () {
        when(mockGetLocationUseCase.execute())
            .thenAnswer((_) async => Left(LocationFailure(TestData.error)));
        return locationBloc;
      },
      act: (bloc) => bloc.add(GetLocationEvent()),
      expect: () =>
          [LocationLoadingState(), LocationErrorState(message: TestData.error)],
    );
  });
}
