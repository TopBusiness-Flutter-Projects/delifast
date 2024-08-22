import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';

class CustomSettingsRow extends StatelessWidget {
  const CustomSettingsRow({
    super.key,
    required this.text,
    required this.icon,
    this.isLanguage = false,
    this.isTheme = false,
    this.isNotification = false,
    this.onTap,
  });
  final String text;
  final String icon;
  final bool isLanguage;
  final bool isTheme;
  final bool isNotification;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 21.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  text.tr(),
                  style: getMediumStyle(
                      fontSize: 15.sp, color: AppColors.black.withOpacity(0.7)),
                ),
                const Spacer(),
                isLanguage
                    ? Text(
                  "lang".tr(),
                  style: getMediumStyle(
                      fontSize: 15.sp, color: AppColors.primary),
                )
                    : isNotification
                    ? const NotificationSwitch()
                    : isTheme
                    ? const ThemeSwitch()
                    : Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: AppColors.primary,
                  size: 20.w,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
          ),
          child: Divider(
            height: 2,
            color: AppColors.gray.withOpacity(.7),
          ),
        ),
      ],
    );
  }
}

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: true,
      activeColor: AppColors.primary,
      onChanged: (bool? value) {
        //  setState(() {
        //    switchValue = value ?? false;
        //  });
      },
    );
  }
}

class NotificationSwitch extends StatelessWidget {
  const NotificationSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: true,
      activeColor: AppColors.primary,
      onChanged: (bool? value) {
        //  setState(() {
        //    switchValue = value ?? false;
        //  });
      },
    );
  }
}
