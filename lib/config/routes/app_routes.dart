import 'package:delifast/features/onboarding/screens/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:delifast/features/main_screen/screens/main_screen.dart';
import 'package:delifast/features/splash/screens/splash_screen.dart';
import '../../core/utils/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/Home/screens/account/screens/about/screens/about_screen.dart';
import '../../features/Home/screens/account/screens/contact_us/screens/contact_us.dart';
import '../../features/Home/screens/account/screens/profile/profile.dart';
import '../../features/Home/screens/home_screen.dart';
import '../../features/Home/screens/notificationi.dart';
import '../../features/Home/screens/order_details/screens/order_details.dart';
import '../../features/Home/screens/order_screen.dart';
import '../../features/Home/screens/pick_up.dart';
import '../../features/Home/screens/shipment _status/screens/shipment _status_screen.dart';
import '../../features/Home/wallet/screens/wallet_screen.dart';
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
  static const String ordersRoutes = '/ordersRoutes';
  static const String pickUpRoutes = '/pickUpRoutes';
  static const String OrdersDetailsRoutes = '/pickUpRoutes';
  static const String notificationRoutes = '/notificationRoute';
  static const String profileRoutes = '/profileRoutes';
  static const String contactRoutes = '/contactRoutes';
  static const String aboutRoutes = '/aboutRoutes';
  static const String shipmentRoutes = '/shipmentRoutes';
  static const String walletRoutes = '/walletRoutes';
  }

class AppRoutes {
  static String route = '';
//
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
        case Routes.shipmentRoutes:
        return MaterialPageRoute(
          builder: (context) => Shipment_Status (),
        );
        case Routes.aboutRoutes:
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );
        case Routes.walletRoutes:
        return MaterialPageRoute(
          builder: (context) =>  WalletScreen(),
        );
      case Routes.contactRoutes:
        return MaterialPageRoute(
          builder: (context) => const ContactUsScreen(),
        );
      case Routes.profileRoutes:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.notificationRoutes:
        return MaterialPageRoute(
          builder: (context) =>  NotificaionScreen(),
        );

      case Routes.OrdersDetailsRoutes:
        return MaterialPageRoute(
          builder: (context) => const orderDetails(),
        );
      case Routes.pickUpRoutes:
        return MaterialPageRoute(
          builder: (context) => const PickUpScreen(),
        );
      case Routes.ordersRoutes:
        return MaterialPageRoute(
          builder: (context) =>  const OrderScreen(),
        );
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
