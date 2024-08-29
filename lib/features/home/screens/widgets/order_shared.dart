import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utils/app_export.dart';
import '../../../orders/cubit/cubit.dart';
import '../../../orders/cubit/state.dart';
import 'package:shimmer/shimmer.dart';

class Ordersdashboard extends StatefulWidget {
  @override
  State<Ordersdashboard> createState() => _OrdersdashboardState();
}

class _OrdersdashboardState extends State<Ordersdashboard> {
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
  void initState() {
    context.read<OrdersCubit>().getStates();
    context.read<OrdersCubit>().getAllOrdersCount();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      var cubit = context.read<OrdersCubit>();
      return cubit.getStatesModel == null
          ? SizedBox(
              height: 220.h,
              width: 190.w,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    //final data = orderData[index];
                    return Container(
                      width: 190.w, height: 220.h,

                      margin: const EdgeInsets.all(8),
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      // child: ,
                    );
                  },
                ),
              ),
            )
          : SizedBox(
              height: 220.h, // Set a fixed height
              width: 190.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cubit.getStatesModel?.result?.length,
                itemBuilder: (context, index) {
                  //final data = orderData[index];
                  return Container(
                    width: 190.w,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: index % 2 == 1
                          ? AppColors.primary
                          : const Color(0xffCE0001),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.local_shipping,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                            Row(
                              children: [
                                Text(
                                  'All orders :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  cubit.allOrderCount.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 8),

                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
//
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  cubit.getStatesModel!.result![index].count
                                          .toString() ??
                                      "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  cubit.getStatesModel!.result![index].name ??
                                      "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                Text(
                                  (((cubit.getStatesModel?.result?[index]
                                                          .count ??
                                                      0) *
                                                  100) /
                                              (cubit.allOrderCount ?? 1))
                                          .toString() +
                                      "%", // تحويل النسبة إلى نص مع منزل عشرية واحدة
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            LinearPercentIndicator(
                              width: 160.w,
                              lineHeight: 10.0,
                              barRadius: const Radius.circular(20),
                              percent:
                                  (cubit.getStatesModel!.result![index].count ??
                                          0) /
                                      cubit.allOrderCount,
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
    });
  }
}
