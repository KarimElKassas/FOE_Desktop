import 'package:egypt_future_chat_desktop/presentation/startScreen/bloc/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void initHub()async {
    var connection = HubConnectionBuilder()
        .withUrl("http://172.16.1.42:9101/communityhub")
        .build();
    print("CONN STATE 1 : ${connection.state}\n");
    await connection.start();
    print("CONN STATE 2 : ${connection.state}\n");
    connection.on("QRCodeData", (arguments) =>
    print("DESKTOP ARGS : $arguments")
    );

    connection.invoke("AddToGroup", args: ["Desktop"]);
  }
}