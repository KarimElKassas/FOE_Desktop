import 'package:hive_flutter/adapters.dart';

import 'chat_model.dart';
import 'message_model.dart';

class MessageModelAdapter extends TypeAdapter<MessageModel> {
  @override
  final int typeId = 2; // unique identifier for this type

  @override
  MessageModel read(BinaryReader reader) {
    final messageId = reader.readInt();
    final messageText = reader.read();
    final messageTime = reader.read();
    final messageTimeString = reader.readString();
    final messageTimeMilliSeconds = reader.readString();
    final senderId = reader.readInt();
    final messageStateId = reader.readInt();
    final messageTypeId = reader.readInt();
    return MessageModel(messageId,messageText,messageTime,messageTimeString,messageTimeMilliSeconds,senderId,messageStateId,messageTypeId);
  }

  @override
  void write(BinaryWriter writer, MessageModel obj) {
    writer.writeInt(obj.messageId);
    writer.writeString(obj.messageText);
    writer.write(obj.messageTime);
    writer.writeString(obj.messageTimeString);
    writer.writeString(obj.messageTimeMilliSeconds);
    writer.writeInt(obj.senderId);
    writer.writeInt(obj.messageStateId);
    writer.writeInt(obj.messageTypeId);
  }
}