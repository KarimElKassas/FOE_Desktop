import 'package:get_it/get_it.dart';

import '../../presentation/startScreen/bloc/login_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void setup() {
    /// Blocs
    sl.registerFactory(() => LoginCubit());
    //sl.registerFactory(() => ArchiveHomeCubit(sl(), sl(), sl(),sl(), sl(), sl(), sl()));

    /// Remote Data Source
    //sl.registerLazySingleton<BaseArchiveRemoteDataSource>(() => ArchiveRemoteDataSource());

    /// Base Archive Repository
    //sl.registerLazySingleton<BaseArchiveRepository>(() => ArchiveRepository(sl()));

    ///Use Cases  1.login User  2.get all address  3.get all letters 4.getAddressByLevel 5.getAddressMaxLevel
    //sl.registerLazySingleton<LoginUserUseCase>(() => LoginUserUseCase(sl()));
  }
}