// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SysModelAdapter extends TypeAdapter<SysModel> {
  @override
  final int typeId = 2;

  @override
  SysModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SysModel(
      country: fields[0] as String,
      sunrise: fields[1] as DateTime,
      sunset: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SysModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SysModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
