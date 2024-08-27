import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:delifast/injector.dart' as injector;
import '../../login/cubit/login_cubit.dart';
import '../../login/cubit/login_states.dart';


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
                                      child: Icon(Icons.arrow_back, size: 30.sp,
                                          color: AppColors.primary)),
                                ),
                                Text(
                                  'contactUs'.tr(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Image.asset(
                              AppImages.contactUsss,scale:3,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.h,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("subject".tr(),style: TextStyle(color:AppColors.black.withOpacity(0.7),fontWeight: FontWeight.w700,fontSize: 18.sp),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextField2(
                                    borderRadius: 8.sp,
                                    labelText: 'enterSubject'.tr(),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("messgae".tr(),style: TextStyle(color:AppColors.black.withOpacity(0.7),fontWeight: FontWeight.w700,fontSize: 18.sp),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextField2(
                                    borderRadius: 8.sp,
                                    labelText: 'enterMessgae'.tr(),isMessage: true,),
                                ),
                                SizedBox(height: 30.h,),
                              ],
                            ),
                          ),
                          CustomButton(text: "send".tr(), onPressed: (){},buttonColor: AppColors.primary)
                        ],
                      )
                  );
                })));
  }}