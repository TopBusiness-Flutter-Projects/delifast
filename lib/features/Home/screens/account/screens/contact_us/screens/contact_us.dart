import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:delifast/injector.dart' as injector;
import '../../../../../../login/cubit/login_cubit.dart';
import '../../../../../../login/cubit/login_states.dart';


class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
                            child: CustomTextField(labelText: 'Name'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomTextField(labelText: 'Phone',),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextField(labelText: 'Email',),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextField(labelText: 'ADRESS',),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextField(
                              isPassword: cubit.isHidden,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      print(cubit.isHidden);
                                      cubit.isHidden = cubit!.isHidden;
                                    });
                                  },
                                  icon: Icon(
                                    cubit!.isHidden
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,
                                    color: AppColors.red,
                                    size: 20.h,
                                  )),
                              hintText: "*********",
                              labelText:  "newPassword".tr(),
                              controller: cubit.passwordController,
                              keyboardType: TextInputType.text,
                              borderRadius: 20,
                              validator: (value) => value!.isEmpty ? '' : null,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextField(
                              isPassword: cubit.isHidden,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      print(cubit.isHidden);
                                      cubit.isHidden = cubit!.isHidden;
                                    });
                                  },

                                  icon: Icon(
                                    cubit!.isHidden
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
                            child: CustomTextField(
                              isPassword: cubit.isHidden,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   print(cubit.isHidden);
                                    //   cubit.isHidden = cubit!.isHidden;
                                    // });
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