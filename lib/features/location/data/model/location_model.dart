import 'package:geolocator/geolocator.dart';
import 'package:weather/features/location/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.lon,
    required super.lat,
    required super.alt,
  });

  factory LocationModel.fromPosition(Position pos) {
    return LocationModel(
      lon: pos.longitude,
      lat: pos.latitude,
      alt: pos.altitude,
    );
  }

  LocationEntity toEntity() {
    return LocationEntity(lon: lon, lat: lat, alt: alt);
  }
}
