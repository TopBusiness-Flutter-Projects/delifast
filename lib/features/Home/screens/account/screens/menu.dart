import 'package:delifast/features/Home/screens/account/screens/widgets/custom_setting_row.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/preferences/preferences.dart';
import '../../../../../core/utils/app_export.dart';
import '../../../../../core/utils/restart_app_class.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'account'.tr(),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, Routes.profileRoutes);

                },
                child: CustomSettingsRow(
                  text: "profile",
                  icon:AppIcons.account,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "contactUs",
                icon: AppIcons.contact,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "language",
                isLanguage: true,
                icon: AppIcons.lang,
                onTap: () {
                  if (EasyLocalization.of(context)!.locale.languageCode == 'ar') {
                    EasyLocalization.of(context)!.setLocale(Locale('en', ''));
                    Preferences.instance.savedLang(AppStrings.englishCode);
                    Preferences.instance.getSavedLang();
                    HotRestartController.performHotRestart(context);
                  } else {
                    EasyLocalization.of(context)!.setLocale(Locale('ar', ''));
                    Preferences.instance.savedLang(AppStrings.arabicCode);
                    Preferences.instance.getSavedLang();
                    HotRestartController.performHotRestart(context);
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "info",
                icon: AppIcons.info,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "rate",
                icon: AppIcons.rate,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "share",
                icon: AppIcons.share,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "privacy",
                icon: AppIcons.privacy,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "logout",
                icon: AppIcons.logout,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
