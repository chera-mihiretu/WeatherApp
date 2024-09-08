import 'package:equatable/equatable.dart';

class WindEntity extends Equatable {
  final double? speed;
  final double? deg;
  final double? gust;

  const WindEntity({
    this.speed,
    this.deg,
    this.gust,
  });

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}
