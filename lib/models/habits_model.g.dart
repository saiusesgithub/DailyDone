// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitsAdapter extends TypeAdapter<Habits> {
  @override
  final int typeId = 0;

  @override
  Habits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habits()
      ..title = fields[0] as String
      ..description = fields[1] as String?
      ..createdon = fields[2] as DateTime
      ..datescompleted = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Habits obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.createdon)
      ..writeByte(3)
      ..write(obj.datescompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
