import 'package:dartz/dartz.dart';
import 'package:weather/cores/exceptions/exception.dart';
import 'package:weather/cores/failure/failure.dart';
import 'package:weather/features/location/data/data_sources/loacation_data_source.dart';
import 'package:weather/features/location/domain/entities/location_entity.dart';
import 'package:weather/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LoacationDataSource loacationDataSource;

  LocationRepositoryImpl({required this.loacationDataSource});
  @override
  Future<Either<Failure, LocationEntity>> getCurrentLocation() async {
    try {
      final result = await loacationDataSource.getCurrentLocation();
      return Right(result.toEntity());
    } on LocationException catch (e) {
      return Left(LocationFailure(e.message));
    }
  }
}
