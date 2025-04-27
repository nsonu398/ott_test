// lib/di/injection_container.dart

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Features
import '../features/home/data/datasources/content_remote_data_source.dart';
import '../features/home/data/repositories/content_repository_impl.dart';
import '../features/home/domain/repositories/content_repository.dart';
import '../features/home/domain/usecases/get_trending_content.dart';
import '../features/home/presentation/bloc/home_bloc.dart';

// Core
import '../core/api/api_client.dart';
import '../core/api/network_info.dart';
import '../core/config/app_config.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features - Home
  // Bloc
  serviceLocator.registerFactory(
        () => HomeBloc(
      getTrendingContent: serviceLocator(),
    ),
  );

  // Use cases
  serviceLocator.registerLazySingleton(() => GetTrendingContent(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<ContentRepository>(
        () => ContentRepositoryImpl(
      remoteDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<ContentRemoteDataSource>(
        () => ContentRemoteDataSourceImpl(client: serviceLocator()),
  );

  //! Core
  serviceLocator.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(() => ApiClient(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppConfig.instance);

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}