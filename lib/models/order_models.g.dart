// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelsAdapter extends TypeAdapter<OrderModels> {
  @override
  final int typeId = 0;

  @override
  OrderModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModels(
      date: fields[0] as String,
      name: fields[1] as String,
      image: fields[2] as String,
      salary: fields[3] as String,
      filling: fields[4] as String,
      milk: fields[5] as String,
      sugar: fields[6] as String,
      number: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModels obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.salary)
      ..writeByte(4)
      ..write(obj.filling)
      ..writeByte(5)
      ..write(obj.milk)
      ..writeByte(6)
      ..write(obj.sugar)
      ..writeByte(7)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
