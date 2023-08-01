import 'package:hive_flutter/adapters.dart';

import 'chat_model.dart';
import 'message_model.dart';

class ChatModelAdapter extends TypeAdapter<ChatModel> {
  @override
  final int typeId = 1; // unique identifier for this type

  @override
  ChatModel read(BinaryReader reader) {
    final chatId = reader.readInt();
    final receiverId = reader.readInt();
    final phoneNumber = reader.readString();
    final fireToken = reader.readString();
    final chatName = reader.readString();
    final chatImage = reader.readString();
    final lastMessage = reader.read() as MessageModel;
    return ChatModel(chatId,receiverId,phoneNumber,fireToken,chatName,chatImage,lastMessage);
  }

  @override
  void write(BinaryWriter writer, ChatModel obj) {
    writer.writeInt(obj.chatId);
    writer.writeInt(obj.receiverId);
    writer.writeString(obj.phoneNumber);
    writer.writeString(obj.fireToken);
    writer.writeString(obj.chatName);
    writer.writeString(obj.chatImage);
    writer.write(obj.lastMessageDto);
  }
}