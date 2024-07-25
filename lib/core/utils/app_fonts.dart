

import 'app_export.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    double? fontHeight,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(
      height: fontHeight,
      fontSize: fontSize,
      fontFamily: AppStrings.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// light style 300
TextStyle getLightStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

TextStyle getLineOverStyle({bool isBold = true}) {
  return TextStyle(
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.primary,
    height: 2,
    decorationThickness: 15,
    fontSize: 16.sp,
    fontFamily: AppStrings.fontFamily,
    color: AppColors.primary,
    fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
  );
}

// regular style 400
TextStyle getRegularStyle(
    {Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

// regular style 600
TextStyle getMediumStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

// bold style 700
TextStyle getBoldStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w700,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

// Extra Bold style 800
TextStyle getExtraStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w800,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}
