

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flight_app/features/flight_search/data/data_source/flight_data_source.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/data_source/login_data_source.dart';
import '../../features/auth/sign_up/data/data_source/signup_data_source.dart';
import '../constants/app_constants.dart';

final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //!External

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
        () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 120000,
          receiveTimeout: 120000,
          sendTimeout: 120000,
          baseUrl: AppConstants.baseUrl,
          headers: {},
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
            responseBody: true,
            requestBody: true,
            responseHeader: true,
            requestHeader: true,
            request: true,
            error: true),
      );
      return dio;
    },
  );

  sl.registerLazySingleton(() => DataConnectionChecker());

  //datasource
  sl.registerLazySingleton<LoginDataSource>(
        () => LoginDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<SignupDataSource>(
        () =>SignupDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<FlightDataSource>(
        () =>FlightDataSourceImpl(dio: sl(), networkInfo: sl()),
  );


}