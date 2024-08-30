import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/features/location/domain/entities/location_entity.dart';
import 'package:weather/features/location/domain/usecases/get_location.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUseCase getLocationUseCase;
  LocationBloc({required this.getLocationUseCase}) : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      emit(LocationLoadingState());
      final result = await getLocationUseCase.execute();
      result.fold((failure) {
        emit(LocationErrorState(message: failure.message));
      }, (data) {
        emit(LocationLoadedState(locationEntity: data));
      });
    });
  }
}
