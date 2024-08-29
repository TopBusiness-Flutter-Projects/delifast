import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/app_export.dart';

class CustomOnboardItem extends StatelessWidget {
  const CustomOnboardItem(
      {super.key,
      required this.image,
      required this.title,
      required this.body,
      this.isLogo = false});
  final String image;
  final String title;
  final String body;
  final bool? isLogo;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isLogo!)
          Image.asset(
            image,
            height: MediaQuery.of(context).size.width / 1.5,
          ),
        SizedBox(
          height: 20.h,
        ),
        Flexible(
          child: Text(
            title.tr(),
            textAlign: TextAlign.center,
            style: getBoldStyle(fontSize: 20.sp, color: AppColors.red),
          ),
        ),
         SizedBox(
          height: 20.h,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              body.tr(),
              style: getRegularStyle(
                  fontSize: 16.sp, fontHeight: 1.2, color: AppColors.secondText),
            ),
          ),
        ),
      ],
    );
  }
}
