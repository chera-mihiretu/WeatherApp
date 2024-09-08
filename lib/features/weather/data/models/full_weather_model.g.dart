// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FullWeatherModelAdapter extends TypeAdapter<FullWeatherModel> {
  @override
  final int typeId = 6;

  @override
  FullWeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FullWeatherModel(
      atmModel: fields[0] as AtmosphereModel,
      coordinateModel: fields[1] as CoordinateModel,
      weatherModels: (fields[2] as List).cast<WeatherModel>(),
      visiblity: fields[3] as double,
      windModel: fields[4] as WindModel,
      sysModel: fields[5] as SysModel,
      name: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FullWeatherModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.atmModel)
      ..writeByte(1)
      ..write(obj.coordinateModel)
      ..writeByte(2)
      ..write(obj.weatherModels)
      ..writeByte(3)
      ..write(obj.visiblity)
      ..writeByte(4)
      ..write(obj.windModel)
      ..writeByte(5)
      ..write(obj.sysModel)
      ..writeByte(6)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FullWeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
