import 'package:egypt_future_chat_desktop/presentation/chatScreen/dummyValues/user.dart';

class DummyValues {
  static List<User> listOfUsers = [
    const User(userName: 'Ahmed Mohamed', messages: [
      'Hello',
      'How are you?'
    ], imagePath: 'assets/images/user.svg'),
    const User(userName: 'Mahmoud Ali', messages: [
      'Hello, Kareem',
      'Is this the new app?'
    ], imagePath: 'assets/images/user.svg'),
    const User(userName: 'Youssef Omran', messages: [
      'Hi',
      'How are you?',
      'Where have you been lately?'
    ], imagePath: 'assets/images/user.svg'),
  ];
}