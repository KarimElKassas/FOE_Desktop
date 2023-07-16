abstract class HomeStates{}

class HomeInitialState extends HomeStates{}
class HomeChangeEditIconBackgroundState extends HomeStates{}
class HomeChangeToolsIconBackgroundState extends HomeStates{}
class HomeChangeEmojiIconBackgroundState extends HomeStates{}
class HomeChangeAttachIconBackgroundState extends HomeStates{}
class HomeChangeChatRowBackgroundState extends HomeStates{}
class HomeChangeCurrentChatState extends HomeStates{}
class HomeLoadChatState extends HomeStates{}
class HomeGetChatSuccessState extends HomeStates{}
class HomeGetChatErrorState extends HomeStates{
  final String error;

  HomeGetChatErrorState(this.error);
}