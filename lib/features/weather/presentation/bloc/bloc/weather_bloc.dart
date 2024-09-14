// ignore: depend_on_referenced_packages
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/cores/constants/constants.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
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
      if (event.cityName.isEmpty) {
        emit(const WeatherErrorState(message: AppData.inputError));
      } else {
        emit(WeatherLoadingState());

        final result =
            await getWeatherByCityNameUsecase.execute(event.cityName);
        result.fold((failure) {
          log('[WEATHER BLOC] message failure');
          emit(WeatherErrorState(message: failure.message));
        }, (data) {
          log('[WEATHER BLOC] We successfully loaded the data');
          log(data.name);
          log(data.visiblity.toString());
          emit(WeatherSearchLoadedState(fullWeatherEntity: data));
        });
      }
    });
    on<GetWeatherByAbsLocationEvent>((event, emit) async {
      emit(WeatherLoadingState());
      final coor = CoordinateEntity(lon: event.lon, lat: event.lat);

      final result = await getWeatherByAbsLocationUsecase.execute(coor);
      result.fold((failure) {
        emit(WeatherErrorState(message: failure.message));
      }, (data) {
        emit(WeatherLoadedState(fullWeatherEntity: data));
      });
    });
  }
}
