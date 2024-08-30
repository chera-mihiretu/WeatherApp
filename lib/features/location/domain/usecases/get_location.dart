import 'package:dartz/dartz.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/location/domain/entities/location_entity.dart';
import 'package:weather/features/location/domain/repositories/location_repository.dart';

class GetLocationUseCase {
  final LocationRepository locationRepository;

  GetLocationUseCase({required this.locationRepository});

  Future<Either<Failure, LocationEntity>> execute() async {
    return await locationRepository.getCurrentLocation();
  }
}
