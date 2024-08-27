import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:delifast/injector.dart' as injector;
import 'package:flutter_html/flutter_html.dart';

import '../../login/cubit/login_cubit.dart';
import '../../login/cubit/login_states.dart';
import '../cubit/setting_cubit.dart';


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
  void initState() {
    super.initState();
    context.read<SettingCubit>().getAboutApp();
  }

  String sanitizeHtml(String htmlContent) {
    // Remove the DOCTYPE and any other problematic tags
    final sanitizedContent = htmlContent.replaceFirst(RegExp(r'^<!DOCTYPE[^>]*>'), '');
    return sanitizedContent;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              SettingCubit cubit = context.read<SettingCubit>();
              return Scaffold(
                backgroundColor: AppColors.white,
                body: SingleChildScrollView(
                  child: Column(
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
                      SizedBox(height: 1.h,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: Image.asset(AppImages.daliFast, scale: .5)),
                      ),
                      SizedBox(height: 20.h,),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text("Why do we use it?", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                          data: sanitizeHtml(cubit.AboutModel.result?.first.about.toString() ?? "nono"),
                          style: {
                            "body": Style(
                              fontSize: FontSize(16.sp),
                            ),
                          },
                        ),
                      ),

                    ],
                  ),
                ),
                            bottomSheet:  SizedBox(height:150,child: Center(child: Image.asset(AppImages.topBusinessLogo, scale: 3))),

              );
            }
        )
    );
  }
}
