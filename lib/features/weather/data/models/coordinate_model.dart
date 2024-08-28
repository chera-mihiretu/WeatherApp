import 'package:weather/features/weather/domain/entities/coordinate_entity.dart';

class CoordinateModel extends CoordinateEntity {
  @override
  // ignore: overridden_fields
  final double lon;
  @override
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
}
