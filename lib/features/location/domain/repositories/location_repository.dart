import 'package:dartz/dartz.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/location/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, LocationEntity>> getCurrentLocation();
}
