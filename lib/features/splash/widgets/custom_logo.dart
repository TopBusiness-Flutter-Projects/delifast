import '../../../core/utils/app_export.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({
    super.key,
    required this.slidingAnimation,
  });
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
              position: slidingAnimation,
              child: Image.asset(
                AppImages.logoImage,
                width: 250.w,
                //height: 300.w,
              ));
        });
  }
}
