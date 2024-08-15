import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_export.dart';

class PackageTrackingCard extends StatelessWidget {
  const PackageTrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.ordersDetailsRoutes);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(0, 2),
            )
          ],
        ),

        margin:  EdgeInsets.all(10.sp),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      shape: BoxShape.circle,

                    ),
                    child: SvgPicture.asset("assets/icons/blueBox.svg"),
                  ),
                  const SizedBox(width: 12),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Blue Flying Shoes',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Tracking ID:94756294',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
               SizedBox(height: 20.h),
              _buildLocationRow(
                icon: Icons.radio_button_checked_rounded,
                color: Colors.grey,
                text: "from".tr(),
                location: '750 Ar Rutab St, Dubai, UAE',
              ),
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
                      Text("shipped_to".tr(), style: const TextStyle(color: Colors.grey)),
                      SizedBox(height: 4.h),
                      const Text("888 Al Nahyan, Abu Dhabi, UAE",
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                child: const Text(
                  'Status: Your package is new',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
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
        Column(
          children: [
            Icon(icon, color: color, size: 20.sp),
            DottedLine(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              lineLength: 40.sp,
              lineThickness: 1.0,
              dashLength: 6.0,
              dashColor: Colors.grey,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ],
        ),
         SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: const TextStyle(color: Colors.grey)),
             SizedBox(height: 4.h),
            Text(location, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

class PackageTrackingCard2 extends StatelessWidget {
  const PackageTrackingCard2({super.key});

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

      margin:  EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
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
                      'Blue Flying Shoes',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tracking ID:94756294',
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
                    "Glass Product",
                    style: TextStyle(color: AppColors.orange, fontSize: 12.sp),
                  )),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            _buildLocationRow(
              icon: Icons.radio_button_checked_rounded,
              color: Colors.grey,
              text: "from".tr(),
              location: '750 Ar Rutab St, Dubai, UAE',
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
                    Text("shipped_to".tr(), style: TextStyle(color: Colors.grey,fontSize: 14.sp)),
                     SizedBox(height: 4.h),
                    Text("888 Al Nahyan, Abu Dhabi, UAE",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp)),
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
                padding:  EdgeInsets.all(8.0.sp),
                child: Row(
                  children: [
                    CircleAvatar(child: SvgPicture.asset(AppIcons.user)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Abdulah",
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
                            Text("Total:",
                                style: TextStyle(
                                    fontSize: 16.sp, fontWeight: FontWeight.w700)),
                            Text("500",
                                style: TextStyle(
                                  color: AppColors.primary,
                                    fontSize: 16.sp, fontWeight: FontWeight.w700)),
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
            Text(text, style:  TextStyle(color: Colors.grey,fontSize: 14.sp)),
            const SizedBox(height: 4),
            Text(location, style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp)),
          ],
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const dashHeight = 5;
    const dashSpace = 3;
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
