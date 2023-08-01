import 'package:egypt_future_chat_desktop/data/models/message_full.dart';
import 'package:egypt_future_chat_desktop/domain/usecase/get_all_chats_use_case.dart';
import 'package:egypt_future_chat_desktop/presentation/startScreen/bloc/login_states.dart';
import 'package:egypt_future_chat_desktop/resources/endpoints.dart';
import 'package:egypt_future_chat_desktop/utils/prefs_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:signalr_core/signalr_core.dart';
import '../../../data/models/chat_full.dart';
import '../../../data/models/message_adapter.dart';
import '../../../data/models/user_model.dart';
import '../../../resources/constants_manager.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(this.getAllChatsUseCase) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  GetAllChatsUseCase getAllChatsUseCase;

  ChatFullModel? chatModel;
  List<ChatFullModel>? chatList;
  List<ChatFullModel>? filteredChatList;
  bool hasBoxKey = false;

  void initHub()async {

    var connection = HubConnectionBuilder()
        .withUrl(EndPoints.hubUrl)
        .withAutomaticReconnect()
        .build();

    print("CONN STATE 1 : ${connection.state}\n");
    await connection.start();
    print("CONN STATE 2 : ${connection.state}\n");

    connection.on("QRCodeData", (arguments) {
      print("QR Desktop Data : $arguments\n");
      if(arguments != null){
        Map<String, dynamic> userData = arguments[0] as Map<String, dynamic>;
        cacheUserData(userData);
        Preference.prefs.setString("sessionToken", arguments[1]);
        getAllChats();
      }
      //emit(LoginLoadingChatsState());
    });

    await connection.invoke("AddToGroup", args: ["Desktop"]);
    connection.onclose((exception) {
      print("Desktop CLOSE Exception : $exception\n");
    });
  }

  void initCaching()async {
    //await Hive.box('Chats').clear();
    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(UserModelAdapter());
    }
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(ChatFullModelAdapter());
    }
    if(!Hive.isAdapterRegistered(2)){
      Hive.registerAdapter(MessageModelAdapter());
    }
    if(!Hive.isAdapterRegistered(3)){
      Hive.registerAdapter(MessageFullModelAdapter());
    }
    if(!Hive.isAdapterRegistered(4)){
      Hive.registerAdapter(ChatFullModelAdapter());
    }
    print("IS OK : ${Hive.isAdapterRegistered(4)}");
    final collection = await BoxCollection.open(
      'ChatCollection', // Name of your database
      {'Users', 'Settings', 'Chats'}, // Names of your boxes
      path: './', // Path where to store your boxes (Only used in Flutter / Dart IO)
    );
  

    // Open your boxes. Optional: Give it a type.
    await collection.openBox<Map<String, dynamic>>('Users');
    await collection.openBox<Map<String, dynamic>>('Settings');
    await collection.openBox<List<ChatFullModel>?>('Chats');
  }

  Future<void> cacheUserData(Map<String, dynamic> userData) async {
    final userBox = await Hive.openBox<Map<String, dynamic>>('Users');
    await userBox.put(userData['userId'], userData);
  }

  Future<void> cacheChatsData(List<ChatFullModel>? data, Box<List<ChatFullModel>?> chatsBox) async {
    await chatsBox.put("ChatsList",data);
    hasBoxKey = true;
    AppConstants.boxKeyNotifier.value = true;
    AppConstants.boxKeyNotifier.notifyListeners();
  }

  Future<void> getAllChats() async {
    emit(LoginLoadingChatsState());
    //getChatsFromServer();

      var boxExist = await Hive.boxExists("Chats");
      if(boxExist){
        var chatsBox = await Hive.openBox<List<ChatFullModel>?>("Chats");
        if(chatsBox.containsKey("ChatsList")){
          print("FROM CACHE #####\n");
          hasBoxKey = true;
          AppConstants.boxKeyNotifier.value = true;
          AppConstants.boxKeyNotifier.notifyListeners();
        }else{
          // create the box then get data from server and cache it
          var chatsBox = await Hive.openBox<List<ChatFullModel>?>("Chats");
          getChatsFromServer(chatsBox);
        }
      }else{
        // create the box then get data from server and cache it
        var chatsBox = await Hive.openBox<List<ChatFullModel>?>("Chats");
        getChatsFromServer(chatsBox);
      }
  }

  void getChatsFromServer(Box<List<ChatFullModel>?> chatsBox)async {
    //get my token
    String token = Preference.prefs.getString("sessionToken").toString();
    print("SESSION TOKEN : $token\n");

    final result = await getAllChatsUseCase(GetAllChatsParameters(token));
    result.fold((l) => emit(LoginGetChatsErrorState(l.message)), (r) {
      chatList = [];
      chatList = r;
      chatList!.sort((b, a) {
        return a.lastMessageDto.messageTimeMilliSeconds.compareTo(
            b.lastMessageDto.messageTimeMilliSeconds);
      });
      filteredChatList = chatList;
      cacheChatsData(filteredChatList, chatsBox);
      print("FROM REQUEST #####\n");
      emit(LoginGetChatsSuccessState());
    });
  }
}