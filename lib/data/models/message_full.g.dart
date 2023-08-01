// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_full.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageFullModelAdapter extends TypeAdapter<MessageFullModel> {
  @override
  final int typeId = 3;

  @override
  MessageFullModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageFullModel(
      fields[0] as FilesList?,
      fields[1] as int,
      fields[2] as String,
      fields[3] as dynamic,
      fields[4] as dynamic,
      fields[5] as int,
      fields[6] as bool,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MessageFullModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.filesList)
      ..writeByte(1)
      ..write(obj.messageId)
      ..writeByte(2)
      ..write(obj.messageTxt)
      ..writeByte(3)
      ..write(obj.messageTime)
      ..writeByte(4)
      ..write(obj.messageTimeString)
      ..writeByte(5)
      ..write(obj.messageTimeMilliSeconds)
      ..writeByte(6)
      ..write(obj.isStarred)
      ..writeByte(7)
      ..write(obj.senderId)
      ..writeByte(8)
      ..write(obj.chatId)
      ..writeByte(9)
      ..write(obj.receiverId)
      ..writeByte(10)
      ..write(obj.messageStateId)
      ..writeByte(11)
      ..write(obj.messageTypeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageFullModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FilesListAdapter extends TypeAdapter<FilesList> {
  @override
  final int typeId = 1;

  @override
  FilesList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilesList(
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FilesList obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.fileListId)
      ..writeByte(1)
      ..write(obj.filePath)
      ..writeByte(2)
      ..write(obj.isRecord)
      ..writeByte(3)
      ..write(obj.fileSize)
      ..writeByte(4)
      ..write(obj.fileName)
      ..writeByte(5)
      ..write(obj.messageId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilesListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
