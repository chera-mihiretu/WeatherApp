// ignore: depend_on_referenced_packages
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/cores/constants/constants.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_by_abs_location_usecase.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_by_city_name_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherByCityNameUsecase getWeatherByCityNameUsecase;
  final GetWeatherByAbsLocationUsecase getWeatherByAbsLocationUsecase;
  WeatherBloc(
      {required this.getWeatherByAbsLocationUsecase,
      required this.getWeatherByCityNameUsecase})
      : super(WeatherInitial()) {
    on<GetWeatherByCiyNameEvent>((event, emit) async {
      log('search by city');
      if (event.cityName.isEmpty) {
        log('Error from input');
        emit(const WeatherErrorState(message: AppData.inputError));
        log('Error from input, Emitted');
      } else {
        emit(WeatherLoadingState());

        final result =
            await getWeatherByCityNameUsecase.execute(event.cityName);
        result.fold((failure) {
          emit(WeatherErrorState(message: failure.message));
        }, (data) {
          emit(WeatherSearchLoadedState(fullWeatherEntity: data));
        });
      }
    });
    on<GetWeatherByAbsLocationEvent>((event, emit) async {
      emit(WeatherLoadingState());
      final coor = CoordinateEntity(lon: event.lon, lat: event.lat);
      log('Weather bloc ${event.lat} ${event.lon}');
      final result = await getWeatherByAbsLocationUsecase.execute(coor);
      result.fold((failure) {
        emit(WeatherErrorState(message: failure.message));
      }, (data) {
        emit(WeatherLoadedState(fullWeatherEntity: data));
      });
    });
  }
}
