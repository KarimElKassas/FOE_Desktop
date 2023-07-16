import 'package:egypt_future_chat_desktop/presentation/startScreen/bloc/login_states.dart';
import 'package:egypt_future_chat_desktop/utils/prefs_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../data/models/user_model.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void initHub()async {

    var connection = HubConnectionBuilder()
        .withUrl("http://172.16.1.42:9101/communityhub")
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
      }
      emit(LoginLoadingChatsState());
    });

    await connection.invoke("AddToGroup", args: ["Desktop"]);
    connection.onclose((exception) {
      print("Desktop CLOSE Exception : $exception\n");
    });
  }

  void initCaching()async {

    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(UserModelAdapter());
    }
    final collection = await BoxCollection.open(
      'ChatCollection', // Name of your database
      {'Users', 'Settings', 'Chats'}, // Names of your boxes
      path: './', // Path where to store your boxes (Only used in Flutter / Dart IO)
    );

    // Open your boxes. Optional: Give it a type.
    collection.openBox<Map<String, dynamic>>('Users');
    collection.openBox<Map<String, dynamic>>('Settings');
    collection.openBox<Map<String, dynamic>>('Chats');
  }

  void cacheUserData(Map<String, dynamic> userData){
    final userBox = Hive.box<Map<String, dynamic>>('Users');
    if(!userBox.isOpen){
      Hive.openBox<Map<String, dynamic>>('Users');
    }

    userBox.put(userData['userId'], userData);

  }
}