part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final FullWeatherEntity fullWeatherEntity;

  const WeatherLoadedState({required this.fullWeatherEntity});
}

final class WeatherErrorState extends WeatherState {
  final String message;

  const WeatherErrorState({required this.message});
}

final class WeatherLoadingState extends WeatherState {}
