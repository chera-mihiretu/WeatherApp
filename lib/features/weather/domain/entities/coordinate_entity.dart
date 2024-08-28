import 'package:equatable/equatable.dart';

class CoordinateEntity extends Equatable {
  final double lon;
  final double lat;

  const CoordinateEntity({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object?> get props => [lon, lat];
}
