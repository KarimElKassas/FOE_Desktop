import 'package:dio/dio.dart';
import 'package:egypt_future_chat_desktop/core/use_case/base_use_case.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_full.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_model.dart';
import 'package:egypt_future_chat_desktop/domain/usecase/get_all_chats_use_case.dart';
import '../../core/error/exception.dart';
import '../../core/network/error_message_model.dart';
import '../../resources/endpoints.dart';
import '../../utils/dio_helper.dart';

abstract class BaseChatRemoteDataSource {
  //Future<String> loginUser(FormData data);
  Future<List<ChatFullModel>> getAllChats(GetAllChatsParameters parameters);
}

class ChatRemoteDataSource implements BaseChatRemoteDataSource {
  @override
  Future<List<ChatFullModel>> getAllChats(GetAllChatsParameters parameters)async {
    final response = await DioHelper.getData(url: EndPoints.getChats, options: Options(headers: {
      'Authorization': 'Bearer ${parameters.data}',
      'Content-Type': 'application/json; charset=utf-8'
    }));

    if(response.statusCode == 200){
      //print("DATA OF ADDRESS : ${response.data}\n");
      return List<ChatFullModel>.from((response.data as List).map((e) => ChatFullModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}