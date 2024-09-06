import 'package:weather/features/location/data/model/location_model.dart';
import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';
import 'package:hive/hive.dart';

part 'coordinate_model.g.dart';

@HiveType(typeId: 0)
class CoordinateModel extends CoordinateEntity {
  @override
  @HiveField(0)
  // ignore: overridden_fields
  final double lon;
  @override
  @HiveField(1)
  // ignore: overridden_fields
  final double lat;

  const CoordinateModel({
    required this.lon,
    required this.lat,
  }) : super(lon: lon, lat: lat);

  // Convert JSON to CoordinateModel
  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      lon: json['lon'].toDouble(),
      lat: json['lat'].toDouble(),
    );
  }

  // Convert CoordinateModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  CoordinateEntity toEntity() {
    return CoordinateEntity(lon: lon, lat: lat);
  }

  factory CoordinateModel.fromEntity(CoordinateEntity coord) {
    return CoordinateModel(
      lon: coord.lon,
      lat: coord.lat,
    );
  }

  factory CoordinateModel.fromLocation(LocationModel location) {
    return CoordinateModel(lon: location.lon, lat: location.lat);
  }
}
