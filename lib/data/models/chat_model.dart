import 'package:egypt_future_chat_desktop/data/models/message_model.dart';
import 'package:egypt_future_chat_desktop/domain/entities/message.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/chat.dart';

//part 'chat_model.g.dart';

@HiveType(typeId: 1)
class ChatModel extends Chat {
  ChatModel(
      @HiveField(0)
      super.chatId,
      @HiveField(1)
      super.receiverId,
      @HiveField(2)
      super.phoneNumber,
      @HiveField(3)
      super.fireToken,
      @HiveField(4)
      super.chatName,
      @HiveField(5)
      super.chatImage,
      @HiveField(6)
      super.lastMessageDto);

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
        json['chatId'],
        json['userId'],
        json['phoneNumber'],
        json['fireToken'],
        json['chatName'],
        json['chatImage'],
        MessageModel.fromJson(json['lastMessageDto']));
  }

}


/*
class ChatModel{
  String chatId;
  String receiverId;
  String userPhone;
  String userFireToken;
  String chatName;
  String chatImage;
  MessageDto messageDto;

  ChatModel(
        this.chatId,
        this.receiverId,
        this.userPhone,
        this.userFireToken,
        this.chatName,
        this.chatImage,
        this.messageDto);

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(json['chatId'],json['userId'],json['phoneNumber'],json['fireToken'],json['chatName'],json['chatImage'], json['lastMessageDto']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['chatId'] = chatId;
    data['userId'] = receiverId;
    data['phoneNumber'] = userPhone;
    data['fireToken'] = userFireToken;
    data['chatName'] = chatName;
    data['chatImage'] = chatImage;
    data['lastMessageDto'] = messageDto.toJson();
    return data;
  }

}
class MessageDto {
  int messageId;
  String messageText;
  DateTime messageTime;
  String messageTimeString;
  String senderId;
  String messageStateId;
  String messageTypeId;
  List<FileLists> fileLists;

  MessageDto(
        this.messageId,
        this.messageText,
        this.messageTime,
        this.messageTimeString,
        this.senderId,
        this.messageStateId,
        this.messageTypeId,
        this.fileLists);

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    List<FileLists>? list;
    json['fileLists'] != null ? (list = <FileLists>[]) : (json['fileLists'].forEach((v) {
      list?.add(FileLists.fromJson(v));
    }));

    return MessageDto(
        json['messageId'],json['messageText'],json['messageTime'],json['messageTimeString'],
        json['senderId'],json['messageStateId'],json['messageTypeId'],
        list!
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messageId'] = messageId;
    data['messageText'] = messageText;
    data['messageTime'] = messageTime;
    data['messageTimeString'] = messageTimeString;
    data['senderId'] = senderId;
    data['messageStateId'] = messageStateId;
    data['messageTypeId'] = messageTypeId;
    data['fileLists'] = fileLists.map((v) => v.toJson()).toList();
    return data;
  }
}
class FileLists{
  String fileListId;
  String fileName;
  String fileSize;
  bool isRecord;
  String messageId;

  FileLists(
      this.fileListId,
        this.fileName,
        this.fileSize,
        this.isRecord,
        this.messageId);

  factory FileLists.fromJson(Map<String, dynamic> json) {
    return FileLists(
        json['fileListId'], json['fileName'], json['fileSize'],
        json['isRecord'], json['messageId']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileListId'] = fileListId;
    data['fileName'] = fileName;
    data['fileSize'] = fileSize;
    data['isRecord'] = isRecord;
    data['messageId'] = messageId;
    return data;
  }
}*/
