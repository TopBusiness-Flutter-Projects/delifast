// ignore_for_file: use_super_parameters

import 'package:easy_localization/easy_localization.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_export.dart';
import 'widgets/custom_onboard_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  bool isLast = false;
  bool isFirst = true;
  List<Widget> pages = [
    CustomOnboardItem(
        image: AppImages.onboarding1,
        title: AppLanguages.onBoard1title,
        body: AppLanguages.onBoard1body),
    CustomOnboardItem(
        image: AppImages.onboarding2,
        title: AppLanguages.onBoard2title,
        body: AppLanguages.onBoard2body),
    CustomOnboardItem(
        image: AppImages.onboarding3,
        title: AppLanguages.onBoard3title,
        body: AppLanguages.onBoard3body),
  ];
  void submit() {
    Preferences.instance
        .setIsFirstTime(key: 'onBoarding', value: true)
        .then((value) {
      print('first timee');
        Navigator.pushNamed(context, Routes.loginRoute);
    }).catchError((error) {
      print('error${error.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isFirst
                          ? SizedBox(
                              width: 1,
                              height: 1,
                            )
                          : GestureDetector(
                              onTap: () {
                                pageController.previousPage(
                                    duration: const Duration(milliseconds: 750),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 24.h,
                                color: AppColors.black,
                              )),
                      Spacer(),
                      isLast
                          ? SizedBox(
                              width: 1,
                              height: 1,
                            )
                          : GestureDetector(
                              onTap: () {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 750),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    AppLanguages.skip,
                                    style:
                                        getRegularStyle(color: AppColors.red),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 24.h,
                                  )
                                ],
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      AppImages.onboardingTop,
                      height: 70.h,
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => pages[index],
                      itemCount: pages.length,
                      onPageChanged: (int index) {
                        if (index == pages.length - 1) {
                          setState(() {
                            isLast = true;
                            print('isLast');
                          });
                        } else {
                          setState(() {
                            isLast = false;
                            print('notLas');
                          });
                        }
                        if (index == 0) {
                          setState(() {
                            isFirst = true;
                            print('notLas');
                          });
                        } else {
                          setState(() {
                            isFirst = false;
                            print('notLas');
                          });
                        }
                      },
                    ),
                  ),
                  SmoothPageIndicator(
                      controller: pageController,
                      // PageController
                      count: pages.length,
                      effect: JumpingDotEffect(
                          paintStyle: PaintingStyle.stroke,
                          activeDotColor: AppColors.secondPrimary,
                          dotColor: AppColors.secondPrimary,
                          dotHeight: 15,
                          dotWidth: 15),
                      // your preferred effect
                      onDotClicked: (index) {}),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      AppImages.onboardingBottom,
                      height: 45.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            isLast
                ? CustomButton(
                    text: "startNow".tr(),
                    buttonColor: AppColors.red,
                    onPressed: () {
                      submit();
                    },
                  )
                : CustomButton(
                    text: "next".tr(),
                    buttonColor: AppColors.red,
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);

                      // submit();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
