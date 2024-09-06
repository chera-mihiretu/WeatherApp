// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WindModelAdapter extends TypeAdapter<WindModel> {
  @override
  final int typeId = 5;

  @override
  WindModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WindModel(
      speed: fields[0] as double,
      deg: fields[1] as double,
      gust: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WindModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.speed)
      ..writeByte(1)
      ..write(obj.deg)
      ..writeByte(2)
      ..write(obj.gust);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
