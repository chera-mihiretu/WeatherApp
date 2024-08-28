import 'package:equatable/equatable.dart';

class AtmosphereEntity extends Equatable {
  final double temp;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double humidity;
  final double seaLevel;
  final double grndLevel;

  const AtmosphereEntity({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  @override
  List<Object?> get props => [
        temp,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel,
      ];
}
