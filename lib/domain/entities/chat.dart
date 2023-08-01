import 'package:egypt_future_chat_desktop/domain/entities/message.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  int chatId;
  int receiverId;
  String phoneNumber;
  String fireToken;
  String chatName;
  String chatImage;
  Message lastMessageDto;

  Chat(this.chatId, this.receiverId, this.phoneNumber, this.fireToken,
      this.chatName, this.chatImage, this.lastMessageDto);

  @override
  List<Object?> get props => [
    chatId,
    receiverId,
    phoneNumber,
    fireToken,
    chatName,
    chatImage,
    lastMessageDto,
  ];

}