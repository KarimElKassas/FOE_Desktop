import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/setting_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';
class SettingCubit extends Cubit<SettingStates>{
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  SidebarXController controller = SidebarXController(selectedIndex: 0, extended: true);
  PageController chatListPageController = PageController();

  void changeListPage(int index) {
    print("INDEX : $index");
    chatListPageController.jumpToPage(index);
  }

}