// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atmosphere_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AtmosphereModelAdapter extends TypeAdapter<AtmosphereModel> {
  @override
  final int typeId = 1;

  @override
  AtmosphereModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AtmosphereModel(
      temp: fields[0] as double,
      tempMin: fields[1] as double,
      tempMax: fields[2] as double,
      pressure: fields[3] as double,
      humidity: fields[4] as double,
      seaLevel: fields[5] as double,
      grndLevel: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, AtmosphereModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.tempMin)
      ..writeByte(2)
      ..write(obj.tempMax)
      ..writeByte(3)
      ..write(obj.pressure)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.seaLevel)
      ..writeByte(6)
      ..write(obj.grndLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AtmosphereModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
