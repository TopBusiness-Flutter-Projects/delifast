import 'package:delifast/core/widgets/top_business_logo.dart';
import 'package:delifast/features/login/cubit/login_cubit.dart';

import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_export.dart';
import '../widgets/custom_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    navigateToHome();
    initSlidingAnimation();

    super.initState();
  }

 void navigateToHome() async {
    Future.delayed(
      const Duration(seconds: 4),
      () {
       

        Preferences.instance.getIsFirstTime(key: 'onBoarding').then((value) {
          if (value != null && value == true) {
            Preferences.instance.getUserName().then((value) async {
              if (value != null) {
                


     String session = await context
                    .read<LoginCubit>()
                    .setSessionId();
                if (session != "error") {
                  Navigator.pushReplacementNamed(context, Routes.mainRoute);
                } else {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                }
               // userName = value;
                // Preferences.instance.getUserPass().then((value) async {
                //   if (value != null) {
                //     userPass = value;

                //       String session = await context
                //     .read<LoginCubit>()
                //     .setSessionId(phoneOrMail: userName, password: userPass);
                // if (session != "error") {
                //   Navigator.pushReplacementNamed(context, Routes.mainRoute);
                // } else {
                //   Navigator.pushReplacementNamed(context, Routes.loginRoute);
                // }
                //   }
                // }).catchError((error) {
                //   debugPrint("ffffffffff" + error.toString());
                // });

              
              } else {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              }
            }).catchError((error) {
              debugPrint("ffffffffff" + error.toString());
            });

            print('not first time');
          } else {
            Navigator.pushReplacementNamed(context, Routes.onBoarding);
            print('first time');
          }
        }).catchError((error) {
          print(error.toString());
        });
      },
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, -50), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 170,
            ),
            CustomAppLogo(
              slidingAnimation: slidingAnimation,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 70.h, right: 20, left: 20),
                child: Image.asset(
                  width: 170.w,
                  AppImages.splashDetails,
                ),
              ),
            )
          ]),
    );
  }
}
