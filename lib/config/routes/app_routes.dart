import 'package:delifast/features/onboarding/screens/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:delifast/features/main_screen/screens/main_screen.dart';
import 'package:delifast/features/splash/screens/splash_screen.dart';
import '../../core/models/order_model.dart';
import '../../core/utils/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/notifications/screens/notificationi.dart';
import '../../features/setting/screens/about_screen.dart';
import '../../features/setting/screens/contact_us.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/order_details/screens/order_details.dart';
import '../../features/orders/screens/order_screen.dart';
import '../../features/setting/screens/privacy_Screen.dart';
import '../../features/setting/screens/profile.dart';
import '../../features/order_details/screens/shipment _status_screen.dart';
import '../../features/verfication_otp/screens/verfiy_otp.dart';
import '../../features/home/screens/wallet_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoarding = '/onBoarding';

  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String onboardingPageScreenRoute = '/onboardingPageScreenRoute';
  static const String verificationCodeScreenRoute =
      '/VerificationCodeScreenRoute';
  static const String homeScreenRoutes = '/HomeScreenRoutes';
  static const String ordersRoutes = '/ordersRoutes';
  static const String pickUpRoutes = '/pickUpRoutes';
  static const String ordersDetailsRoutes = '/pickUpRoutes';
  static const String notificationRoutes = '/notificationRoute';
  static const String profileRoutes = '/profileRoutes';
  static const String contactRoutes = '/contactRoutes';
  static const String aboutRoutes = '/aboutRoutes';
  static const String shipmentRoutes = '/shipmentRoutes';
  static const String walletRoutes = '/walletRoutes';
  static const String privcyRoutes = '/privcyRoutes';
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
          builder: (context) => const ShipmentStatus(),
        );
      case Routes.aboutRoutes:
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );
      case Routes.walletRoutes:
        return MaterialPageRoute(
          builder: (context) => const WalletScreen(),
        );
      case Routes.contactRoutes:
        return MaterialPageRoute(
          builder: (context) => const ContactUsScreen(),
        );
      case Routes.profileRoutes:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.privcyRoutes:
        return MaterialPageRoute(
          builder: (context) => const Privacy_screen(),
        );
      case Routes.notificationRoutes:
        return MaterialPageRoute(
          builder: (context) => const NotificaionScreen(),
        );

      case Routes.ordersDetailsRoutes:
        OrderModel model = settings.arguments as OrderModel;

        return MaterialPageRoute(
          builder: (context) => OrderDetails(orderModel: model),
        );
      case Routes.ordersRoutes:
        return MaterialPageRoute(
          builder: (context) => const OrderScreen(
            isInMainScreen: true,
          ),
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
          child: const LoginScreen(),
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
          child: const VerificationCodeScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
        );

      case Routes.mainRoute:
        return PageTransition(
          child: const MainScreen(),
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
