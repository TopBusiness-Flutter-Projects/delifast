import 'package:easy_localization/easy_localization.dart';
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
  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector.serviceLocator<LoginCubit>(),
      child: SafeArea(
        child: BlocBuilder<LoginCubit, LoginStates>(
          builder: (context, state) {
            LoginCubit cubit = context.read<LoginCubit>();

            return Scaffold(
              backgroundColor: AppColors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Form(
                        key: cubit.formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(18.h),
                                child: Text(
                                  AppLanguages.sign_in,
                                  style: getBoldStyle(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(height: 15.h),
                              CustomTextField2(
                                labelText: AppLanguages.email,
                                hintText: "email@yourdomain.com",
                                suffixIcon: Icon(
                                  isEmailValid ? Icons.check : Icons.email,
                                  color: isEmailValid
                                      ? Colors.green
                                      : AppColors.red,
                                  size: 20.h,
                                ),
                                borderRadius: 20,
                                keyboardType: TextInputType.emailAddress,
                                controller: cubit.EmailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter_email'.tr();
                                    // } else if (!RegExp(
                                    //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                    //     .hasMatch(value)) {
                                    //   return 'invalid_email'.tr();
                                    // }
                                  }
                                 else
                                  return null;
                                },
                                onChanged: (value) {
                                  // setState(() {
                                  //   isEmailValid = RegExp(
                                  //           r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                  //       .hasMatch(value);
                                  // });
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextField2(
                                isPassword: cubit.isHidden,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    cubit.togglePasswordVisibility();
                                  },
                                  icon: Icon(
                                    cubit.isHidden
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,
                                    color: AppColors.red,
                                    size: 20.h,
                                  ),
                                ),
                                hintText: "*********",
                                labelText: AppLanguages.enterPassword,
                                controller: cubit.passwordController,
                                keyboardType: TextInputType.text,
                                borderRadius: 20,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter_password'.tr();
                                  }
                                  //  else if (value.length < 8) {
                                  //   return 'password_too_short'.tr();
                                  // }
                                  return null;
                                },
                                onChanged: (value) {
                                  // setState(() {
                                  //   isPasswordValid = value.length >= 8;
                                  // });
                                },
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Image.asset(AppIcons.checkIcon),
                                        ),
                                        Text(
                                          AppLanguages.remember_me,
                                          style: TextStyle(
                                              color: AppColors.gray,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          Routes.verificationCodeScreenRoute);
                                    },
                                    child: Text(
                                      AppLanguages.forgetPassword,
                                      style: TextStyle(
                                          color: AppColors.red,
                                          fontSize: 16.sp),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomButton(
                                  text: AppLanguages.sign_in,
                                  buttonColor: AppColors.primaryButton,
                                  onPressed: () {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      cubit.signupValidate(context);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 35.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
