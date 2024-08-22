import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../core/preferences/preferences.dart';
import '../../../../../core/utils/app_export.dart';
import '../../../../../core/utils/restart_app_class.dart';
import '../../account/screens/widgets/custom_setting_row.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor:  AppColors.white,
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
                  Navigator.pushNamed(context, Routes.profileRoutes);

                },
                child:  CustomSettingsRow(
                  text: "profile".tr(),
                  icon:AppIcons.account,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "contact_us".tr(),
                onTap: (){
                  Navigator.pushNamed(context, Routes.contactRoutes);
                },
                icon: AppIcons.contact,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                text: "language".tr(),
                isLanguage: true,
                icon: AppIcons.lang,
                onTap: () {
                  if (EasyLocalization.of(context)!.locale.languageCode == 'ar') {
                    EasyLocalization.of(context)!.setLocale(const Locale('en', ''));
                    Preferences.instance.savedLang(AppStrings.englishCode);
                    Preferences.instance.getSavedLang();
                    HotRestartController.performHotRestart(context);
                  } else {
                    EasyLocalization.of(context)!.setLocale(const Locale('ar', ''));
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
                onTap: (){
                  Navigator.pushNamed(context, Routes.aboutRoutes);
                },
                text: "info".tr(),
                icon: AppIcons.info,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                onTap: ()async{
                  PackageInfo packageInfo =
                      await PackageInfo.fromPlatform();
                  String url = '';
                  String packageName = packageInfo.packageName;

                  if (Platform.isAndroid) {
                    url =
                    "https://play.google.com/store/apps/details?id=$packageName";
                  } else if (Platform.isIOS) {
                    url =
                    'https://apps.apple.com/us/app/$packageName';
                  }
                  if (await canLaunch(url)) {
                  await launch(url);
                  } else {
                  throw 'Could not launch $url';
                  }
                },
                text: "rate",
                icon: AppIcons.rate,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSettingsRow(
                onTap: ()async{
                  PackageInfo packageInfo =
                      await PackageInfo.fromPlatform();
                  String url = '';
                  String packageName = packageInfo.packageName;
                  if (Platform.isAndroid) {
                    url =
                    "https://play.google.com/store/apps/details?id=$packageName";
                  } else if (Platform.isIOS) {
                    url =
                    'https://apps.apple.com/us/app/$packageName';
                  }
                  await Share.share(url);
                },
                text: "share".tr(),
                icon: AppIcons.share,
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: CustomSettingsRow(
                text: "privacy".tr(),
                icon: AppIcons.privacy,
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: CustomSettingsRow(
                onTap: (){
                  Navigator.pushNamed(context, Routes.loginRoute);
                },
                text: "logout".tr(),
                icon: AppIcons.logout,
              ),
            ),
          ],
        ),

      ),
    );
  }
}
