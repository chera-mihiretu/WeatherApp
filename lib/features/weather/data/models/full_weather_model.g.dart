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
      coordinateModel: fields[0] as CoordinateModel,
      weatherModels: (fields[1] as List).cast<WeatherModel>(),
      visiblity: fields[2] as double,
      windModel: fields[3] as WindModel,
      sysModel: fields[4] as SysModel,
      name: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FullWeatherModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.coordinateModel)
      ..writeByte(1)
      ..write(obj.weatherModels)
      ..writeByte(2)
      ..write(obj.visiblity)
      ..writeByte(3)
      ..write(obj.windModel)
      ..writeByte(4)
      ..write(obj.sysModel)
      ..writeByte(5)
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
