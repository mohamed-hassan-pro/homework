// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'islamic_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IslamicEventAdapter extends TypeAdapter<IslamicEvent> {
  @override
  final int typeId = 0;

  @override
  IslamicEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IslamicEvent(
      id: fields[0] as String,
      nameEn: fields[1] as String,
      nameAr: fields[2] as String,
      hijriMonth: fields[3] as int,
      hijriDay: fields[4] as int,
      hijriYear: fields[5] as int,
      gregorianDate: fields[6] as DateTime,
      descriptionEn: fields[7] as String,
      descriptionAr: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IslamicEvent obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameEn)
      ..writeByte(2)
      ..write(obj.nameAr)
      ..writeByte(3)
      ..write(obj.hijriMonth)
      ..writeByte(4)
      ..write(obj.hijriDay)
      ..writeByte(5)
      ..write(obj.hijriYear)
      ..writeByte(6)
      ..write(obj.gregorianDate)
      ..writeByte(7)
      ..write(obj.descriptionEn)
      ..writeByte(8)
      ..write(obj.descriptionAr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IslamicEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
