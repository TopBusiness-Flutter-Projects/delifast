import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/models/order_model.dart';

class ShipmentWidget extends StatelessWidget {
  ShipmentWidget({super.key, this.model});
  OrderModel? model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3.0,
            offset: Offset(0, 2),
          )
        ],
      ),
      margin: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppIcons.boxOrange),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model?.orderName ?? '',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tracking ID:${model?.name ?? ''}',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),
                Container(
                  width: 100.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(30.sp)),
                  child: Center(
                      child: Text(
                    model?.currentNameOfCategory ?? '',
                    style: TextStyle(color: AppColors.orange, fontSize: 12.sp),
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            _buildLocationRow(
              icon: Icons.radio_button_checked_rounded,
              color: Colors.grey,
              text: "from".tr(),
              location: model?.senderStreet ?? '',
            ),
            SizedBox(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(Icons.radio_button_checked_rounded,
                        color: const Color(0xffCE0001), size: 20.sp),
                  ],
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("shipped_to".tr(),
                        style: const TextStyle(color: Colors.grey)),
                    SizedBox(height: 4.h),
                    Text(model?.receiverStreet ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Divider(
              height: 6.h,
              thickness: 1,
            ),
            Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Row(
                  children: [
                    CircleAvatar(child: SvgPicture.asset(AppIcons.user)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(model?.senderName ?? '',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700)),
                          Text("Provider",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text("total".tr(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700)),
                            Text((model?.totalChargeAmount ?? '').toString(),
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("Sr",
                              style: TextStyle(
                                fontSize: 14.sp,
                              )),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color color,
    required String text,
    required String location,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
            const SizedBox(height: 4),
            Text(location,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
          ],
        ),
      ],
    );
  }
}
