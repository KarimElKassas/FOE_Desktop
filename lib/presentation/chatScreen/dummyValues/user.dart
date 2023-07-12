import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userName;
  final List<String> messages;
  final String imagePath;

  const User({required this.userName, required this.messages, required this.imagePath});

  @override
  List<Object?> get props => [userName, messages, imagePath];
}