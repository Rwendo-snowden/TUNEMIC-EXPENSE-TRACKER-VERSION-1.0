// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mauzo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class mauzoAdapter extends TypeAdapter<mauzo> {
  @override
  final int typeId = 1;

  @override
  mauzo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return mauzo(
      amount: fields[1] as int,
      reason: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, mauzo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.reason)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is mauzoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
