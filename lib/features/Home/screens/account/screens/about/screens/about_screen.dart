import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:delifast/injector.dart' as injector;
import '../../../../../../login/cubit/login_cubit.dart';
import '../../../../../../login/cubit/login_states.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
                                  'aboutApp'.tr(),
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height:1.h ,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Image.asset(AppImages.daliFast,scale:.5)),
                          ),
                          SizedBox(height: 20.h,),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text("Why do we use it?",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),),
),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). ",style: TextStyle(fontSize: 16.sp),),
                          ),

                        ],
                      ),
                    bottomSheet: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppImages.topBusinessLogo,scale:3),
                      ),
                    ),
                  );
                })));
  }}