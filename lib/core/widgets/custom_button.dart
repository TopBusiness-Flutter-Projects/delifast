import 'package:delifast/core/utils/app_fonts.dart';


import '../utils/app_export.dart';


class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? buttonColor;

  final bool isDisabled;
  final bool isGoogle;

  final Widget? icon;
  final double? width;
  final double? padding;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isDisabled = false,
      this.isGoogle = false,
      this.textColor,
      this.buttonColor,
      this.icon,
      this.width,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 30),
        child: GestureDetector(
          onTap: isDisabled ? () {} : onPressed,
          child: SizedBox(
              //  height: 46,
              width: width,
              child: Container(
                decoration: isGoogle
                    ? BoxDecoration(
                        color: isDisabled ? Colors.grey : AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(.1),
                              spreadRadius: 2.00,
                              blurRadius: 13.00,
                              offset: const Offset(0, 0)),
                        ],
                        // border: Border.all(color: ColorManager.red),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      )
                    : BoxDecoration(
                        color: isDisabled
                            ? Colors.grey
                            : buttonColor ?? AppColors.secondPrimary,
                        border: Border.all(
                            color: isGoogle
                                ? AppColors.white
                                : AppColors.secondPrimary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          text!,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle(
                              color: textColor ?? AppColors.white,
                              fontSize: 18.sp),
                        ),
                      ),
                      if (icon != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: icon!,
                        ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
