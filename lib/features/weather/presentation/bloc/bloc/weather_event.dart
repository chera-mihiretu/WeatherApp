part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  final List<dynamic> changeTracker;
  const WeatherEvent({this.changeTracker = const []});

  @override
  List<Object> get props => [
        changeTracker,
      ];
}

final class GetWeatherByCiyNameEvent extends WeatherEvent {
  final String cityName;

  GetWeatherByCiyNameEvent({
    required this.cityName,
  }) : super(changeTracker: [cityName]);
}

final class GetWeatherByAbsLocationEvent extends WeatherEvent {
  final CoordinateEntity coordinateEntity;

  GetWeatherByAbsLocationEvent({required this.coordinateEntity})
      : super(changeTracker: [coordinateEntity]);
}
