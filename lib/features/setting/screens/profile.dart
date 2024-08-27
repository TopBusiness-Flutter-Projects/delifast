import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:delifast/injector.dart' as injector;
import '../../login/cubit/login_cubit.dart';
import '../../login/cubit/login_states.dart';
import '../cubit/setting_cubit.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SettingCubit>().getUserData().then((value){

      print('aaaaaaaaaaaa$value');


    });


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          SettingCubit cubit = context.read<SettingCubit>();
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back, size: 30.sp, color: AppColors.blackblue)),
                      ),
                      Text(
                        'profile'.tr(),
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField2(
                            labelText: 'name'.tr(),controller:cubit.nameControllser),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CustomTextField2(labelText: 'phone'.tr(),controller:cubit.mobileController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField2(labelText: 'email'.tr(),controller:cubit.emailController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField2(labelText: 'address'.tr(),controller:cubit.addressController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField2(
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
                          labelText: "enter_pass".tr(),
                          controller: cubit.passwordController,
                          keyboardType: TextInputType.text,
                          borderRadius: 20,
                          validator: (value) => value!.isEmpty ? '' : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField2(
                          isPassword: cubit.isHiddenNewPass,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.togglePasswordVisibility2();
                            },
                            icon: Icon(
                              cubit.isHiddenNewPass
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: AppColors.red,
                              size: 20.h,
                            ),
                          ),
                          hintText: "*********",
                          labelText: "newPassword".tr(),
                          controller: cubit.newPasswordController,
                          keyboardType: TextInputType.text,
                          borderRadius: 20,
                          validator: (value) => value!.isEmpty ? '' : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField2(
                          isPassword: cubit.isHiddenConfirm,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.togglePasswordVisibility3();
                            },
                            icon: Icon(
                              cubit.isHiddenConfirm
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: AppColors.red,
                              size: 20.h,
                            ),
                          ),
                          hintText: "*********",
                          labelText: "confirm_password".tr(),
                          controller: cubit.ConfirmPasswordController,
                          keyboardType: TextInputType.text,
                          borderRadius: 20,
                          validator: (value) => value!.isEmpty ? '' : null,
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(text: 'update'.tr(), onPressed: () {
                          cubit.updateProfile(context);
                        },
                          buttonColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
