import 'package:easy_localization/easy_localization.dart';

import '../../../core/utils/app_export.dart';

class NotificaionScreen extends StatelessWidget {
    const NotificaionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'notification'.tr(),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding:  EdgeInsets.only(top: 5.sp,right: 10.0.sp,left: 10.0.sp,bottom: 5.sp),
                  child: Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      color:AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                       CircleAvatar(
                         child: Image.asset(AppIcons.daliFast),
                       ),
                        SizedBox(width: 4.w,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("New Order",style:TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color:AppColors.primary)),
                                    ),
                                    Text("just now",style: TextStyle(color:AppColors.primary,fontSize: 14.sp),),
                                  ],
                                ),
                              ),
                               Text("A new order has been addd",style: TextStyle(
                                  color:AppColors.black,fontSize: 14.sp),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  ),
                );
              },itemCount: 4,),
            )

          ],
        ),
      ),
    );
  }
}
