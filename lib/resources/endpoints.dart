class EndPoints{
  static const String baseUrl = 'http://172.16.1.42:9000/api';
  static const String hubUrl = 'http://172.16.1.42:9000/communityHub';
  static const String hubUrl2 = 'http://172.16.1.42:9000/chathub';
  static const String authEnd = '$baseUrl/auth';
  static const String login = '$authEnd/Login';
  static const String chatsEnd = '$baseUrl/Chat';
  static const String getChats = '$chatsEnd/GetChats';
}