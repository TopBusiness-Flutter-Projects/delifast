import 'package:easy_localization/easy_localization.dart';

import '../../../core/utils/app_export.dart';

class NotificaionScreen extends StatelessWidget {
    NotificaionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
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
              child: ListView.builder(itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50.h,
                    child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                       CircleAvatar(
                         child: Image.asset(AppIcons.daliFast,),
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
                                  //  Spacer(),
                                    Text("just now",style: TextStyle(color:AppColors.primary),),

                                  ],
                                ),
                              ),
                              Text("A new order has been addd"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                    decoration: BoxDecoration(
                      color:AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
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
