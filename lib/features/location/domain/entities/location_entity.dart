import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double lon;
  final double lat;
  final double alt;

  const LocationEntity(
      {required this.lon, required this.lat, required this.alt});

  @override
  List<Object?> get props => [
        lon,
        lat,
        alt,
      ];
}
