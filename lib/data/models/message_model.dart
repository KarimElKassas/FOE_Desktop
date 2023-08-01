import 'package:egypt_future_chat_desktop/domain/entities/message.dart';
import 'package:hive/hive.dart';

//part 'message_model.g.dart';

@HiveType(typeId: 2)
class MessageModel extends Message {
  MessageModel(
      @HiveField(0)
      super.messageId,
      @HiveField(1)
      super.messageText,
      @HiveField(2)
      super.messageTime,
      @HiveField(3)
      super.messageTimeString,
      @HiveField(4)
      super.messageTimeMilliSeconds,
      @HiveField(5)
      super.senderId,
      @HiveField(6)
      super.messageStateId,
      @HiveField(7)
      super.messageTypeId);

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        json['messageId'],
        json['messageText'],
        json['messageTime'].toString(),
        json['messageTimeString'],
        json['messageTimeMilliSeconds'],
        json['senderId'],
        json['messageStateId'],
        json['messageTypeId']);
  }

  Map<String, dynamic> toJson() => {
    'messageId': messageId,
    'messageText': messageText,
    //'messageTime': messageTime,
    'messageTimeString': messageTimeString,
    'messageTimeMilliSeconds': messageTimeMilliSeconds,
    'senderId': senderId,
    'messageStateId': messageStateId,
    'messageTypeId': messageTypeId,
  };
}