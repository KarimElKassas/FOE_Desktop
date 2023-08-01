import 'package:egypt_future_chat_desktop/data/datasource/chat_remote_data_source.dart';
import 'package:egypt_future_chat_desktop/domain/repository/base_chat_repository.dart';
import 'package:egypt_future_chat_desktop/domain/usecase/get_all_chats_use_case.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/home_cubit.dart';
import 'package:egypt_future_chat_desktop/presentation/chatScreen/bloc/setting_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../data/repository/chat_repository.dart';
import '../../presentation/startScreen/bloc/login_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void setup() {
    /// Blocs
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerFactory(() => HomeCubit(sl()));
    sl.registerFactory(() => SettingCubit());
    //sl.registerFactory(() => ArchiveHomeCubit(sl(), sl(), sl(),sl(), sl(), sl(), sl()));

    /// Remote Data Source
    sl.registerLazySingleton<BaseChatRemoteDataSource>(() => ChatRemoteDataSource());

    /// Base Chat Repository
    sl.registerLazySingleton<BaseChatRepository>(() => ChatRepository(sl()));

    ///Use Cases  1.login User  2.get all address  3.get all letters 4.getAddressByLevel 5.getAddressMaxLevel
    sl.registerLazySingleton<GetAllChatsUseCase>(() => GetAllChatsUseCase(sl()));
  }
}