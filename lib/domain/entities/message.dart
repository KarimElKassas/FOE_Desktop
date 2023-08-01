import 'package:equatable/equatable.dart';

class Message extends Equatable{
  int messageId;
  String messageText;
  dynamic messageTime;
  dynamic messageTimeString;
  dynamic messageTimeMilliSeconds;
  int senderId;
  int messageStateId;
  int messageTypeId;

  Message(this.messageId, this.messageText, this.messageTime, this.messageTimeString, this.messageTimeMilliSeconds, this.senderId, this.messageStateId, this.messageTypeId);

  @override
  List<Object?> get props => [
    messageId,
    messageText,
    messageTime,
    messageTimeString,
    messageTimeMilliSeconds,
    senderId,
    messageStateId,
    messageTypeId,
  ];
}