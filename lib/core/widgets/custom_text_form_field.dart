import '../utils/app_export.dart';

class CustomTextField2 extends StatefulWidget {
  final String? labelText;
  final String? hintText;

  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;

  final bool isMessage;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  //FocusNode myFocusNode = FocusNode();
  const CustomTextField2({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isMessage = false,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.isPassword = false,
    this.onSubmitted,
    this.borderRadius,
    this.hintText,
  });

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  FocusNode myFocusNode = FocusNode();

  void initState() {
    super.initState();

    myFocusNode.addListener(() {
      setState(() {
        // color = Colors.black;
      });
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.isMessage ? 100.h : null,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.sp),
          child: TextFormField(
            controller: widget.controller,
            expands: false,
            onTap: widget.onTap,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            focusNode: myFocusNode,
            style: getBoldStyle(),
            onChanged: widget.onChanged,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            initialValue: widget.initialValue,
            obscureText: widget.isPassword,
            maxLines: widget.isMessage ? 5 : 1,
            minLines: widget.isMessage ? 5 : 1,
            onFieldSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
                hintText: widget.hintText,
                filled: true,
                fillColor: AppColors.white,
                labelText: widget.labelText,
                labelStyle: getRegularStyle(
                    fontHeight: 1.5,
                    color:
                        myFocusNode.hasFocus ? AppColors.gray : AppColors.gray),
                prefixIcon: widget.prefixIcon,
                // prefixIconColor: myFocusNode.hasFocus ? ColorManager.primary : ColorManager.primaryGrey,
                suffixIcon: widget.suffixIcon,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                hintStyle:
                    getRegularStyle(color: AppColors.black, fontSize: 16.sp),
                errorStyle: getRegularStyle(color: AppColors.red),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.gray, width: 1.w),
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 20.sp))),

                // focused border style
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.gray, width: 1.w),
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 20.sp))),

                // error border style
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red, width: 1.w),
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 20.sp))),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red, width: 1.w),
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 20.sp)))),
          ),
        ));
  }
}
