part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  final List<dynamic> changingState;
  const LocationState({this.changingState = const []});

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoadedState extends LocationState {
  final LocationEntity locationEntity;

  LocationLoadedState({required this.locationEntity})
      : super(changingState: [locationEntity]);
}

final class LocationLoadingState extends LocationState {}

final class LocationErrorState extends LocationState {
  final String message;

  LocationErrorState({required this.message}) : super(changingState: [message]);
}
