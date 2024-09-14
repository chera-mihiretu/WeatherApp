import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 4)
class WeatherModel extends WeatherEntity {
  @override
  @HiveField(0)
  // ignore: overridden_fields
  final int id;
  @override
  @HiveField(1)
  // ignore: overridden_fields
  final String main;
  @override
  @HiveField(2)
  // ignore: overridden_fields
  final String description;
  @override
  @HiveField(3)
  // ignore: overridden_fields
  final String icon;

  const WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  }) : super(
          id: id,
          main: main,
          description: description,
          icon: icon,
        );

  // Convert JSON to WeatherModel
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  // Convert WeatherModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  WeatherEntity toEntity() {
    return WeatherEntity(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }

  static List<WeatherModel> fromJsonList(List<dynamic> json) {
    List<WeatherModel> result =
        json.map((each) => WeatherModel.fromJson(each)).toList();
    return result;
  }

  static List<WeatherEntity> toEntityList(List<WeatherModel> models) {
    List<WeatherEntity> result =
        models.map((model) => model.toEntity()).toList();
    return result;
  }
}
