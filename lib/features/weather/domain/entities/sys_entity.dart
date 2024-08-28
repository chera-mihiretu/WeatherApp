import 'package:equatable/equatable.dart';

class SysEntity extends Equatable {
  final String country;
  final DateTime sunrise;
  final DateTime sunset;

  const SysEntity({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
        country,
        sunrise,
        sunset,
      ];
}
