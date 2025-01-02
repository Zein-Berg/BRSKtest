import 'package:brsk_test_2/common/bloc/button_state_cubit.dart';
import 'package:brsk_test_2/feature/data/data_sources/remote_data_source.dart';
import 'package:brsk_test_2/feature/data/repositories/auth_repository_impl.dart';
import 'package:brsk_test_2/feature/domain/repositories/auth_repository.dart';
import 'package:brsk_test_2/feature/domain/use_cases/is_logged_in_use_case.dart';
import 'package:brsk_test_2/feature/domain/use_cases/sign_in_use_case.dart';
import 'package:brsk_test_2/feature/domain/use_cases/sign_out_use_case.dart';
import 'package:brsk_test_2/feature/domain/use_cases/sign_up_use_case.dart';
import 'package:brsk_test_2/feature/presentation/splash/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc / Cubit
  sl.registerFactory(
    () => SplashCubit(isLoggedInUseCase: sl()),
  );

  sl.registerFactory(() => ButtonStateCubit());

  // UseCases
  sl.registerLazySingleton(() => IsLoggedInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignOutUseCase(authRepository: sl()));
  // forgot password use case
  // post task use case
  // get task list use case
  //sl.registerLazySingleton(() => );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      // networkInfoClass()
      remoteDataSource: sl(),
    ),
  );

  // DataSource
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImp(),
  );

  // Core
  // NetworkInfo class

  // External
  // LocalStateManagement
  // Http
  // Clients
  // InternetConnectionCheckers
}
