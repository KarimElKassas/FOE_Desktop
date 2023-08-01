import 'dart:convert';
import 'dart:io';

import 'package:egypt_future_chat_desktop/data/models/chat_full.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_full.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_full.dart';
import 'package:egypt_future_chat_desktop/data/models/message_model.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_states.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/dummyValues/dummy_values.dart';
import 'package:egypt_future_chat_desktop/resources/color_manager.dart';
import 'package:egypt_future_chat_desktop/resources/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../../data/models/chat_model.dart';
import '../../../domain/usecase/get_all_chats_use_case.dart';
import '../../../utils/prefs_helper.dart';
import '../dummyValues/user.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.getAllChatsUseCase) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  SidebarXController controller = SidebarXController(selectedIndex: 0);
  PageController chatListPageController = PageController();
  ValueNotifier<User?> chosenUser = ValueNotifier(null);
  Color editIconButtonBackground = ColorManager.transparent,
      toolsIconButtonBackground = ColorManager.transparent,
      emojiIconButtonBackground = ColorManager.transparent,
      attachIconButtonBackground = ColorManager.transparent,
      chatRowBackground = ColorManager.transparent;

  GetAllChatsUseCase getAllChatsUseCase;

  ChatFullModel? chatModel;
  List<ChatFullModel>? chatList;
  List<ChatFullModel>? filteredChatList;

  void initChatHub() => AppConstants.initHub();

  void getChatsFromServer() async {
    //get my token
    String token = Preference.prefs.getString("sessionToken").toString();
    print("SESSION TOKEN : $token\n");

    final result = await getAllChatsUseCase(GetAllChatsParameters(token));
    result.fold((l) => emit(HomeGetChatErrorState(l.message)), (r) {
      chatList = [];
      chatList = r;
      chatList!.sort((b, a) {
        return a.lastMessageDto.messageTimeMilliSeconds
            .compareTo(b.lastMessageDto.messageTimeMilliSeconds);
      });
      filteredChatList = chatList;
      //cacheChatsData(filteredChatList, chatsBox);
      print("FROM REQUEST #####\n");
      emit(HomeGetChatSuccessState());
    });
  }

  String formatShortTime(String time) {
    var parts = time.split(' ');
    return parts[1];
  }

  void changeEditIconButtonBackground(Color newColor) {
    if (editIconButtonBackground != newColor) {
      editIconButtonBackground = newColor;
      emit(HomeChangeEditIconBackgroundState());
    }
  }

  void changeToolsIconButtonBackground(Color newColor) {
    if (toolsIconButtonBackground != newColor) {
      toolsIconButtonBackground = newColor;
      emit(HomeChangeToolsIconBackgroundState());
    }
  }

  void changeChatRowBackground(Color newColor) {
    if (chatRowBackground != newColor) {
      chatRowBackground = newColor;
      emit(HomeChangeChatRowBackgroundState());
    }
  }

  void changeEmojiIconButtonBackground(Color newColor) {
    if (emojiIconButtonBackground != newColor) {
      emojiIconButtonBackground = newColor;
      emit(HomeChangeEmojiIconBackgroundState());
    }
  }

  void changeAttachIconButtonBackground(Color newColor) {
    if (attachIconButtonBackground != newColor) {
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

  void search(String searchQuery) {
    filteredChatList = chatList!
        .where((chat) =>
            chat.chatName.toLowerCase().contains(searchQuery.toString()))
        .toList();
    emit(HomeFilterChats());
  }

  void sendMessageHub(int chatId, String message, int partnerId) async {
    String shortTime = DateFormat("yyyy-MM-dd hh:mm:ss a").format(DateTime.now());
    var myID = Hive.box<Map<String, dynamic>>("Users").getAt(0)?.entries.first.value ??0;
    Map <String, dynamic> messageData = {
      'fileLists.File': "",
      'fileLists.IsRecord': false,
      'fileLists.FileSize': "",
      'fileLists.FileName': "",
      'chatId' : chatId,
      'messageId' : 50,
      'messageText' : message,
      'messageTimeString' : shortTime,
      'messageTimeMilliSeconds' : DateTime.now().microsecondsSinceEpoch,
      'isStarred' : false,
      'senderId' : myID,
      'messageTypeId' : 1,
      'messageStateId' : 1,
      'receiverId' : partnerId
    };

    final jsonString = jsonEncode(messageData);
    print("JSON : $jsonString");
    await AppConstants.connection?.invoke("SendMessage", args: [jsonString]);

  }
}
