import 'package:hive/hive.dart';
part 'message_full.g.dart';
@HiveType(typeId: 3)
class MessageFullModel {
  @HiveField(0)
  FilesList? filesList;
  @HiveField(1)
  int messageId;
  @HiveField(2)
  String messageTxt;
  @HiveField(3)
  dynamic messageTime;
  @HiveField(4)
  dynamic messageTimeString;
  @HiveField(5)
  int messageTimeMilliSeconds;
  @HiveField(6)
  bool isStarred;
  @HiveField(7)
  String senderId;
  @HiveField(8)
  String chatId;
  @HiveField(9)
  String receiverId;
  @HiveField(10)
  String messageStateId;
  @HiveField(11)
  String messageTypeId;

  MessageFullModel(
      this.filesList,
      this.messageId,
      this.messageTxt,
      this.messageTime,
      this.messageTimeString,
      this.messageTimeMilliSeconds,
      this.isStarred,
      this.senderId,
      this.chatId,
      this.receiverId,
      this.messageStateId,
      this.messageTypeId);

  factory MessageFullModel.fromHubJson(Map<String, dynamic> json) {
    return MessageFullModel(
        json['fileLists'] != null
            ? FilesList.fromJson(json['fileLists'])
            : null,
        json['messageId'],
        json['messageText'],
        json['messageTime'],
        json['messageTimeString'],
        json['messageTimeMilliSeconds'],
        json['isStarred'],
        json['senderId'],
        json['chatId'],
        json['receiverId']??"",
        json['messageStateId'],
        json['messageTypeId']
    );
  }

  factory MessageFullModel.fromJson(Map<String, dynamic> json) {
    return MessageFullModel(
        json['fileLists'] != null
            ? FilesList.fromJson(json['fileLists'])
            : null,
        json['messageId'],
        json['messageText'],
        null, // message time
        json['messageTimeString'],
        json['messageTimeMilliSeconds'],
        json['isStarred'],
        json['senderId'],
        json['chatId'],
        json['receiverId']??"",
        json['messageStateId'],
        json['messageTypeId']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (filesList != null) {
      data['fileLists'] = filesList!.filesToJson();
    }
    data['messageId'] = messageId;
    data['messageText'] = messageTxt;
    //data['messageTime'] = messageTime;
    data['messageTimeString'] = messageTimeString;
    data['messageTimeMilliSeconds'] = messageTimeMilliSeconds;
    data['isStarred'] = isStarred;
    data['senderId'] = senderId;
    data['chatId'] = chatId;
    data['receiverId'] = receiverId;
    data['messageStateId'] = messageStateId;
    data['messageTypeId'] = messageTypeId;
    return data;
  }

}

@HiveType(typeId: 1)
class FilesList {
  @HiveField(0)
  String fileListId;
  @HiveField(1)
  String filePath;
  @HiveField(2)
  bool isRecord;
  @HiveField(3)
  String fileSize;
  @HiveField(4)
  String fileName;
  @HiveField(5)
  String messageId;

  FilesList(
      this.fileListId,
      this.filePath,
      this.isRecord,
      this.fileSize,
      this.fileName,
      this.messageId);

  factory FilesList.fromJson(Map<String, dynamic> json) {
    return FilesList(
        json['fileListId'],
        json['filePath'],
        json['isRecord'],
        json['fileSize'] ,
        json['fileName'],
        json['messageId']
    );
  }

  Map<String, dynamic> filesToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileListId'] = fileListId;
    data['filePath'] = filePath;
    data['isRecord'] = isRecord;
    data['fileSize'] = fileSize;
    data['fileName'] = fileName;
    return data;
  }
}