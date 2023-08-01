import 'package:hive/hive.dart';
import 'message_full.dart';

part 'chat_full.g.dart';
@HiveType(typeId: 4)
class ChatFullModel {
  @HiveField(0)
  int chatId;
  @HiveField(1)
  int receiverId;
  @HiveField(2)
  String phoneNumber;
  @HiveField(3)
  String fireToken;
  @HiveField(4)
  String chatName;
  @HiveField(5)
  String chatImage;
  @HiveField(6)
  MessageFullModel lastMessageDto;

  ChatFullModel(this.chatId, this.receiverId, this.phoneNumber, this.fireToken,
      this.chatName, this.chatImage, this.lastMessageDto);

  factory ChatFullModel.fromJson(Map<String, dynamic> json){
    return ChatFullModel(
        json['chatId'],
        json['userId'],
        json['phoneNumber'],
        json['fireToken'],
        json['chatName'],
        json['chatImage'],
        MessageFullModel.fromJson(json['lastMessageDto']));
  }
}