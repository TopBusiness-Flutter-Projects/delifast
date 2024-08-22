import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:delifast/injector.dart' as injector;
import 'dart:ui' as ui;
import '../../login/cubit/login_cubit.dart';
import '../../login/cubit/login_states.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String? selectedStatus;
  DateTime? selectedDate;
  final List<String> statusOptions = [
    'Pending',
    'In Progress',
    'Delivered',
    'Cancelled'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => injector.serviceLocator<LoginCubit>(),
        child: SafeArea(child:
            BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
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
                          child: Icon(Icons.arrow_back,
                              size: 30.sp, color: AppColors.blackblue)),
                    ),
                    Text(
                      'wallet'.tr(),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primary,
                  ),
                  // width: double.infinity,
             //     height: 100.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColors.white,
                                  ),
                                  child:
                                      Image.asset(AppIcons.wallet, scale: .9)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "my_balance".tr(),
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "25487\$",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'history'.tr(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black.withOpacity(0.8)
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const ShipmentAmountWidget();
                    }),
              ),
            ],
          ));
        })));
  }
}


class ShipmentAmountWidget extends StatelessWidget {
  const ShipmentAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppIcons.forwadicon, scale: .8),
              SizedBox(width: 12.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'The Shipment Amount Add To The Wallet',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.sp),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'July 13, 8:06',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.sp),
          CustomPaint(
            painter: DottedLinePainter(),
            size: const ui.Size(double.infinity, 1),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, ui.Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 7;
    const double dashSpace = 4;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
          ui.Offset(startX, 0), ui.Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// ... (rest of the code)
