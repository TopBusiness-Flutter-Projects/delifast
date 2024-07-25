import '../../../core/utils/app_export.dart';
import 'package:delifast/features/login/cubit/login_cubit.dart';
import 'package:delifast/features/login/cubit/login_states.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHidden = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<LoginCubit,LoginStates>(
        
        builder: (context, state) {
        LoginCubit cubit = context.read<LoginCubit>();

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(18.h),
                              child: Text(
                                AppLanguages.logIn,
                                style: getBoldStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomText(text: AppLanguages.phone),
                            CustomTextField(
                              labelText: AppLanguages.enterPhone,
                              keyboardType: TextInputType.phone,
                              controller: phoneNumberController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     CustomText(text: "password"),
                            //     TextButton(
                            //         onPressed: () {
                            //       //   Navigator.pushNamed(context,
                            //       //       Routes.forgetPasswordScreenRoute);
                            //         },
                            //         child: Text(
                            //           "forgetPassword".tr(),
                            //           style: getRegularStyle(
                            //               color: AppColors.grey2,
                            //               fontSize: 14.sp),
                            //         ))
                            //   ],
                            // ),
                            CustomTextField(
                              isPassword: isHidden,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      print(isHidden);
                                      isHidden = !isHidden;
                                    });
                                  },
                                  icon: Icon(
                                    !isHidden
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.red,
                                    size: 20.h,
                                  )),
                              labelText: AppLanguages.enterPassword,
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                text: AppLanguages.logIn,
                                onPressed: () {
                                  // Navigator.pushNamedAndRemoveUntil(context,
                                  //     Routes.mainRoute, (route) => false);
                                  // if (formKey.currentState!.validate()) {
                                  // } else {
                                  //   errorGetBar("من فضلك املأ الحقول");
                                  //   print('Form is Not valid');
                                  // }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Flexible(
                            //       child: Text(
                            //         "doNotHaveAccount".tr(),
                            //         style:
                            //             getRegularStyle(color: AppColors.black),
                            //       ),
                            //     ),
                            //     TextButton(
                            //         onPressed: () {
                            //           Navigator.pushNamed(
                            //               context, Routes.registerRoute);
                            //         },
                            //         child: Text(
                            //           "createAccount".tr(),
                            //           style: getRegularStyle(
                            //               color: AppColors.primary),
                            //         ))
                            //   ],
                            // ),
                          ]),
                    ),
                  ),
                ),
                Image.asset(
                  width: double.infinity,
                  AppImages.login,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
