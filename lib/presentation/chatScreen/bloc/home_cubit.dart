import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_states.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/dummyValues/dummy_values.dart';
import 'package:egypt_future_chat_desktop/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

import '../dummyValues/user.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  SidebarXController controller = SidebarXController(selectedIndex: 0);
  PageController chatListPageController = PageController();
  ValueNotifier<User?> chosenUser = ValueNotifier(null);
  Color editIconButtonBackground = ColorManager.transparent, toolsIconButtonBackground = ColorManager.transparent ,emojiIconButtonBackground = ColorManager.transparent ,attachIconButtonBackground = ColorManager.transparent , chatRowBackground = ColorManager.transparent;

  void changeEditIconButtonBackground(Color newColor) {
    if(editIconButtonBackground != newColor){
      editIconButtonBackground = newColor;
      emit(HomeChangeEditIconBackgroundState());
    }
  }
  void changeToolsIconButtonBackground(Color newColor) {
    if(toolsIconButtonBackground != newColor){
      toolsIconButtonBackground = newColor;
      emit(HomeChangeToolsIconBackgroundState());
    }
  }
  void changeChatRowBackground(Color newColor) {
    if(chatRowBackground != newColor){
      chatRowBackground = newColor;
      emit(HomeChangeChatRowBackgroundState());
    }
  }
  void changeEmojiIconButtonBackground(Color newColor) {
    if(emojiIconButtonBackground != newColor){
      emojiIconButtonBackground = newColor;
      emit(HomeChangeEmojiIconBackgroundState());
    }
  } void changeAttachIconButtonBackground(Color newColor) {
    if(attachIconButtonBackground != newColor){
      attachIconButtonBackground = newColor;
      emit(HomeChangeAttachIconBackgroundState());
    }
  }
  void changeListPage(int index) {
    chatListPageController.jumpToPage(index);
  }

  void changeSelectedUser(int index) {
    chosenUser.value = DummyValues.listOfUsers[index];
    emit(HomeGetChatSuccessState());
  }
}
