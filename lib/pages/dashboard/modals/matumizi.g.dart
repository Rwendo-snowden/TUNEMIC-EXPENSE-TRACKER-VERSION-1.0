// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matumizi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class matumiziAdapter extends TypeAdapter<matumizi> {
  @override
  final int typeId = 0;

  @override
  matumizi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return matumizi(
      amount: fields[1] as int,
      reason: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, matumizi obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is matumiziAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
