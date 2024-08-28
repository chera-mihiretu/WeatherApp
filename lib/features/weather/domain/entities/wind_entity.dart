import 'package:equatable/equatable.dart';

class WindEntity extends Equatable {
  final double speed;
  final double deg;
  final double gust;

  const WindEntity({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}
