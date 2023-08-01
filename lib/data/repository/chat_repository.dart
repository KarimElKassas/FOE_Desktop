import 'package:dartz/dartz.dart';
import 'package:egypt_future_chat_desktop/core/use_case/base_use_case.dart';
import 'package:egypt_future_chat_desktop/data/datasource/chat_remote_data_source.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_full.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_model.dart';
import 'package:egypt_future_chat_desktop/domain/repository/base_chat_repository.dart';
import 'package:egypt_future_chat_desktop/domain/usecase/get_all_chats_use_case.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';

class ChatRepository extends BaseChatRepository {
  final BaseChatRemoteDataSource baseChatRemoteDataSource;

  ChatRepository(this.baseChatRemoteDataSource);

  @override
  Future<Either<Failure, List<ChatFullModel>>> getAllChats(GetAllChatsParameters parameters)async {
    final result = await baseChatRemoteDataSource.getAllChats(parameters);

    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}