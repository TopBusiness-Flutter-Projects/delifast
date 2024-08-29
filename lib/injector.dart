import 'package:delifast/features/login/cubit/login_cubit.dart';
import 'package:delifast/features/orders/cubit/cubit.dart';
import 'package:delifast/features/setting/cubit/setting_cubit.dart';
import 'package:dio/dio.dart';
import 'package:delifast/features/main_screen/cubit/cubit.dart';
import 'package:delifast/features/splash/cubit/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:delifast/core/remote/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/order_details/cubit/order_details_cubit.dart';
// import 'features/downloads_videos/cubit/downloads_videos_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////

  serviceLocator.registerFactory(
    () => SplashCubit(),
  );
  serviceLocator.registerFactory(
    () => OrderDetailsCubit(
      serviceLocator(),
    ),
       
  );

  serviceLocator.registerFactory(
    () => LoginCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => MainCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => OrdersCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => SettingCubit(
      serviceLocator(),
    ),
  );

  ///////////////////////////////////////////////////////////////////////////////

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
