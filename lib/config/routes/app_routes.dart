import 'package:delifast/features/onboarding/screens/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:delifast/features/main_screen/screens/main_screen.dart';
import 'package:delifast/features/splash/screens/splash_screen.dart';
import '../../core/utils/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/Home/screens/home_screen.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/verfication_otp/screens/verfiy_otp.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoarding = '/onBoarding';

  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String onboardingPageScreenRoute = '/onboardingPageScreenRoute';

  static const String verificationCodeScreenRoute = '/VerificationCodeScreenRoute';
  static const String homeScreenRoutes = '/HomeScreenRoutes';

}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      // case Routes.detailsRoute:
      //   final service = settings.arguments as ServicesModel;
      //   return MaterialPageRoute(
      //     // Extract the service model argument from the settings arguments map
      //
      //     builder: (context) => Details(service: service),
      //   );
      //
      case Routes.loginRoute:
        return PageTransition(
          child: LoginScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
        );

      case Routes.homeScreenRoutes:
        return PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
        );
      case Routes.verificationCodeScreenRoute:
        return PageTransition(
          child: VerificationCodeScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
        );

      case Routes.mainRoute:
        return PageTransition(
          child: MainScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
        );
    

      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      // case Routes.resultOfLessonExam:
      //   ResponseOfApplyLessonExmamData model =
      //       settings.arguments as ResponseOfApplyLessonExmamData;
      //   return PageTransition(
      //     child: ResultExamLessonScreen(model: model),
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 800),
      //   );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
