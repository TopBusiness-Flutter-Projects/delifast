import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utils/app_export.dart';

class Ordersdashboard extends StatelessWidget {
  final List<Map<String, dynamic>> orderData = [
    {
      'color': const Color(0xffCE0001),
      'newOrders': 500,
      'inProgress': 50,
      'progress': 0.5,
      'label': 'inprogress',
    },
    {
      'color': AppColors.primary,
      'newOrders': 500,
      'inProgress': 400,
      'progress': 0.8,
      'label': 'complete',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h, // Set a fixed height
      width: 190.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: orderData.length,
        itemBuilder: (context, index) {
          final data = orderData[index];
          return Container(
            width: 190.w,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: data['color'],
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Icon(Icons.local_shipping, color: Colors.white,size: 30.sp,),
                const SizedBox(height: 8),
                 Text(
                  'All Orders',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['newOrders']}',
                          style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold),
                        ),
                         Text(
                          'new order',
                          style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['inProgress']}',
                          style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data['label'],
                          style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                //     Spacer(),
                SizedBox(height: 15.h),
                 Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                          'Progress',
                          style: TextStyle(color: Colors.white, fontSize: 12.sp),

                                         ),
                         Text("50%",
                           style: TextStyle(color: Colors.white, fontSize: 12.sp),
                         )
                       ],
                     ),
                     SizedBox(height: 20.h),
                     LinearPercentIndicator(
                       width: 160.w,
                       lineHeight: 10.0,
                       barRadius: const Radius.circular(20),
                       percent: .9,
                       backgroundColor: AppColors.white.withOpacity(.5),
                       progressColor: AppColors.white,
                     ),
                   ],
                 ),
                // Expanded(
                //   child: LinearProgressIndicator(
                //     value: data['progress'],
                //     backgroundColor: Colors.lightBlue,
                //     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                //   ),
                // ),

                //   SizedBox(height: 8),
                // Text(
                //   '${(data['progress'] * 100).toInt()}%',
                //   style: TextStyle(color: Colors.white),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
