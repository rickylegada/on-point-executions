import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:on_point_executions/core/network/api_client.dart';
import 'package:on_point_executions/data/repositories/user_repository_impl.dart';
import 'package:on_point_executions/domain/repositories/user_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Register Retrofit API Client
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>()));

  // Register Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl<ApiClient>()));

}
