import '../../../core/utils/app_export.dart';
import 'package:delifast/features/login/cubit/login_cubit.dart';
import 'package:delifast/features/login/cubit/login_states.dart';
import 'package:delifast/injector.dart' as injector;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => injector.serviceLocator<LoginCubit>(),
    child: SafeArea(
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
                    key:cubit.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(18.h),
                              child: Text(
                                AppLanguages.sign_in,
                                style: getBoldStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomTextField(
                              labelText: AppLanguages.email,
                               hintText: "email@yourdomain.com",
                              suffixIcon: IconButton(
                                  onPressed: () {

                                  },
                                  icon: Icon(
                                         Icons.check,
                                    color: AppColors.red,
                                    size: 20.h,
                                  )),
                              borderRadius: 20,

                              keyboardType: TextInputType.phone,
                              controller: cubit.EmailController,
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
                              isPassword:cubit. isHidden,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      print(cubit.isHidden);
                                     cubit. isHidden = cubit!.isHidden;
                                    });
                                  },

                                  icon: Icon(
                                   cubit!.isHidden
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.red,
                                    size: 20.h,
                                  )),
                              hintText: "*********",
                              labelText: AppLanguages.enterPassword,
                              controller:cubit. passwordController,
                              keyboardType: TextInputType.text,
                              borderRadius: 20,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(AppIcons.checkIcon),
                                  )  ,
                                      Text(AppLanguages.remember_me,style: TextStyle(color:AppColors.gray,fontSize: 16.sp),),
                                    ],
                                  ),
                                ),
                                Text(AppLanguages.forgetPassword,style: TextStyle(color:AppColors.red,fontSize: 16.sp))
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(

                                text: AppLanguages.sign_in,
                                buttonColor: AppColors.primaryButton,
                                onPressed: () {
                                  cubit.signupValidate(context);

//                                   if (cubit.formKey.currentState!.validate()) {
// cubit.login();
//                                   }
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
                // Image.asset(
                //   width: double.infinity,
                //   AppImages.login,
                // )
              ],
            ),
          ),
        );
      }),
    )
    );
  }
}
