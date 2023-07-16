import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends Equatable{
  @HiveField(0)
  int userId;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String phoneNumber;
  @HiveField(4)
  String password;
  @HiveField(5)
  String userImage;
  @HiveField(6)
  String bio;
  @HiveField(7)
  String fireToken;
  @HiveField(8)
  String createAt;
  @HiveField(9)
  String deleteAt;
  @HiveField(10)
  int userPrivacyId;
  @HiveField(11)
  int accountStateId;

  UserModel(
      this.userId,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.password,
      this.userImage,
      this.bio,
      this.fireToken,
      this.createAt,
      this.deleteAt,
      this.userPrivacyId,
      this.accountStateId
      );

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        int.parse(jsonData['userId']),
        jsonData['firstName'].toString(),
        jsonData['lastName'].toString(),
        jsonData['phoneNumber'].toString(),
        jsonData['password'].toString(),
        jsonData['userImage'].toString(),
        jsonData['bio'].toString(),
        jsonData['fireToken'].toString(),
        jsonData['createAt'].toString(),
        jsonData['deleteAt'].toString(),
        int.parse(jsonData['userPrivacyId']),
        int.parse(jsonData['accountStateId'])
    );
  }

  static Map<String, dynamic> toMap(UserModel userModel) => {
    'userId': userModel.userId,
    'firstName': userModel.firstName,
    'lastName': userModel.lastName,
    'phoneNumber': userModel.phoneNumber,
    'password': userModel.password,
    'userImage': userModel.userImage,
    'bio': userModel.bio,
    'fireToken': userModel.fireToken,
    'createAt': userModel.createAt,
    'deleteAt': userModel.deleteAt,
    'userPrivacyId': userModel.userPrivacyId,
    'accountStateId': userModel.accountStateId
  };

  static String encode(List<UserModel> users) => json.encode(
    users
        .map<Map<String, dynamic>>((user) => UserModel.toMap(user))
        .toList(),
  );

  static List<UserModel> decode(String users) =>
      (json.decode(users) as List<dynamic>)
          .map<UserModel>((item) => UserModel.fromJson(item))
          .toList();

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        userId,
        firstName,
        lastName,
        userImage,
        bio,
        fireToken,
        createAt,
        phoneNumber,
        deleteAt,
        userPrivacyId,
        accountStateId,
        password,
      ];
}