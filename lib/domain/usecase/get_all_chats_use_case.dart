import 'package:dartz/dartz.dart';
import 'package:egypt_future_chat_desktop/data/models/chat_full.dart';
import 'package:egypt_future_chat_desktop/domain/repository/base_chat_repository.dart';
import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';

class GetAllChatsUseCase extends BaseUseCase<List<ChatFullModel>, GetAllChatsParameters> {
  BaseChatRepository chatRepository;
  GetAllChatsUseCase(this.chatRepository);

  @override
  Future<Either<Failure, List<ChatFullModel>>> call(GetAllChatsParameters parameters)async {
    return await chatRepository.getAllChats(parameters);
  }
}

class GetAllChatsParameters {
  final String data;

  GetAllChatsParameters(this.data);
}
