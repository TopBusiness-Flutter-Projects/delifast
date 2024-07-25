import 'package:delifast/core/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:delifast/features/main_screen/cubit/cubit.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:delifast/injector.dart' as injector;

import 'features/login/cubit/login_cubit.dart';
import 'features/splash/cubit/cubit.dart';

class DelifastApp extends StatefulWidget {
  const DelifastApp({Key? key}) : super(key: key);

  @override
  State<DelifastApp> createState() => _DelifastAppState();
}

class _DelifastAppState extends State<DelifastApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(text);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => injector.serviceLocator<SplashCubit>(),
                ),
                // BlocProvider(
                //   create: (_) => injector.serviceLocator<LoginCubit>(),
                // ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<MainCubit>(),
                ),
              ],
              child: GetMaterialApp(
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: appTheme(),
                themeMode: ThemeMode.light,
                darkTheme: ThemeData.light(),
                // standard dark theme
                localizationsDelegates: context.localizationDelegates,
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              ));
        });
  }
}
