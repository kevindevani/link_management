// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LinkListModelAdapter extends TypeAdapter<LinkListModel> {
  @override
  final int typeId = 0;

  @override
  LinkListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LinkListModel(
      link: fields[0] as String,
      title: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LinkListModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.link)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
