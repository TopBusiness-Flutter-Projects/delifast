import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/features/Home/screens/widgets/package_order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:delifast/injector.dart' as injector;

import '../../../../../login/cubit/login_cubit.dart';
import '../../../../../login/cubit/login_states.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? selectedStatus;
  DateTime? selectedDate;
  final List<String> statusOptions = ['Pending', 'In Progress', 'Delivered', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => injector.serviceLocator<LoginCubit>(),
    child: SafeArea(
    child: BlocBuilder<LoginCubit,LoginStates>(
    builder: (context, state) {
      LoginCubit cubit = context.read<LoginCubit>();
      return Scaffold(
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
                          child: Icon(Icons.arrow_back, size: 30.sp,
                              color: AppColors.blackblue)),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField2(labelText: 'name'.tr()),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomTextField2(labelText: 'phone'.tr(),),
              ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField2(labelText: 'email'.tr(),),
              ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField2(labelText: 'address'.tr(),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField2(
                    isPassword: cubit.isHidden,
                    suffixIcon: IconButton(
                        onPressed: () {
                          cubit.togglePasswordVisibility();

                        },
                        icon: Icon(
                          cubit!.isHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          color: AppColors.red,
                          size: 20.h,
                        )),
                    hintText: "*********",
                    labelText: AppLanguages.enterPassword,
                    controller: cubit.passwordController,
                    keyboardType: TextInputType.text,
                    borderRadius: 20,
                    validator: (value) => value!.isEmpty ? '' : null,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField2(
                  isPassword: cubit.isHiddenNewPass,
                  suffixIcon: IconButton(
                      onPressed: () {
                        cubit.togglePasswordVisibility2();

                      },
//
                      icon: Icon(
                        cubit!.isHiddenNewPass
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        color: AppColors.red,
                        size: 20.h,
                      )),
                  hintText: "*********",
                  labelText: "newPassword".tr(),
                  controller: cubit.passwordController,
                  keyboardType: TextInputType.text,
                  borderRadius: 20,
                  validator: (value) => value!.isEmpty ? '' : null,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField2(
                  isPassword: cubit.isHiddenConfirm,
                  suffixIcon: IconButton(
                      onPressed: () {
                        // setState(() {
                        //   print(cubit.isHidden);
                        //   cubit.isHidden = cubit!.isHidden;
                        // });
                        cubit.togglePasswordVisibility3();
                      },
                      icon: Icon(
                        cubit!.isHiddenConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        color: AppColors.red,
                        size: 20.h,
                      )),
                  hintText: "*********",
                  labelText: "confirm_password".tr(),
                  controller: cubit.passwordController,
                  keyboardType: TextInputType.text,
                  borderRadius: 20,
                  validator: (value) => value!.isEmpty ? '' : null,),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(text: 'update'.tr(), onPressed: () {
                },
                  buttonColor: AppColors.primary,
                ),
              ),
            ],
          )
      );
    })));
    }}