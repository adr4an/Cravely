// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PizzaHiveModelAdapter extends TypeAdapter<PizzaHiveModel> {
  @override
  final int typeId = 0;

  @override
  PizzaHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PizzaHiveModel(
      pizzaId: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as double,
      discount: fields[4] as double,
      imgUrl: fields[5] as String,
      categories: fields[6] as String,
      rating: fields[7] as double,
      cals: fields[8] as int,
      carbs: fields[9] as int,
      proteins: fields[10] as int,
      fats: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PizzaHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.pizzaId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.imgUrl)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.cals)
      ..writeByte(9)
      ..write(obj.carbs)
      ..writeByte(10)
      ..write(obj.proteins)
      ..writeByte(11)
      ..write(obj.fats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PizzaHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
