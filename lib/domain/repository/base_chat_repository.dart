import 'package:dartz/dartz.dart';
import 'package:egypt_future_chat_desktop/core/use_case/base_use_case.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_full.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_model.dart';
import 'package:egypt_future_chat_desktop/domain/usecase/get_all_chats_use_case.dart';

import '../../core/error/failure.dart';

abstract class BaseChatRepository {
 // Future<Either<Failure, String>> loginUser(LoginUserParameters parameters);
  Future<Either<Failure, List<ChatFullModel>>> getAllChats(GetAllChatsParameters parameters);

}