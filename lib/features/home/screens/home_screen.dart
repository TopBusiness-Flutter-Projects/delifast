import 'package:delifast/core/models/order_model.dart';
import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/core/widgets/buttons_container.dart';
import 'package:delifast/features/home/screens/widgets/order_shared.dart';
import 'package:delifast/features/delivered/screens/delivered_screen.dart';
import 'package:delifast/features/main_screen/cubit/cubit.dart';
import 'package:delifast/features/order_details/screens/widget/shipment_widget.dart';
import 'package:delifast/features/orders/cubit/cubit.dart';
import 'package:delifast/features/orders/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/widgets/package_order.dart';
import '../../orders/screens/order_screen.dart';
import '../../orders/screens/order_screen_home.dart';
import 'drop_off.dart';
import 'wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _options = [
    // {'icon': AppImages.walletPhoto, 'label': 'Wallet', 'screen': const WalletScreen()},
    {
      'icon': AppIcons.Truck,
      'label': 'Pick Up',
      'screen': OrderScreenHome(
        stateId: '1',
      )
    },
    {
      'icon': AppIcons.Drops,
      'label': 'Drop Off',
      'screen': OrderScreenHome(
        stateId: '2',
      )
    },
    {
      'icon': AppIcons.History,
      'label': 'History',
      'screen': OrderScreenHome(
        stateId: '3',
      )
    },
  ];

  // @override
  // void initState() {
  //   context.read<OrdersCubit>().getOrders();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        var cubit = context.read<OrdersCubit>();
        return Scaffold(
          backgroundColor: AppColors.white,
          body: (state is OrdersLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.sp),
                              bottomRight: Radius.circular(30.sp)),
                          color: AppColors.primary,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // width: MediaQuery.of(context).size.width/2.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0.sp),
                                color: AppColors.blackblue,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0.sp),
                                      child: Icon(Icons.location_on_rounded,
                                          color: AppColors.red),
                                    ),
                                    Text(
                                      'Abu Dhabi, UAE',
                                      maxLines: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "track_your_package".tr(),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "please_enter_your_tracking_number".tr(),
                              style: const TextStyle(color: Colors.white70),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Enter_tracking_number".tr(),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.gray,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0.sp),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DeliveredScreen()));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffCE0001),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Icon(Icons.qr_code_scanner,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 90.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _options.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final option = _options[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => option['screen']),
                                  );
                                },
                                child: OptionButton(
                                  icon: option['icon'],
                                  label: option['label'],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0.sp),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "tracking_history".tr(),
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<MainCubit>().onItemTapped(1);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "see_all".tr(),
                                          style: TextStyle(
                                              color: AppColors.gray,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.gray,
                                          size: 15.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            SizedBox(
                              // height: 140.0.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: (context
                                                .read<OrdersCubit>()
                                                .mainOrderModel!
                                                .result!
                                                .length ??
                                            0) >=
                                        2
                                    ? 2
                                    : context
                                        .read<OrdersCubit>()
                                        .mainOrderModel!
                                        .result!
                                        .length,
                                itemBuilder: (context, index) {
                                  return _buildTrackingCard(context
                                      .read<OrdersCubit>()
                                      .mainOrderModel!
                                      .result?[index]);
                                },
                              ),
                            ),
                            SizedBox(height: 24.sp),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "statistics".tr(),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Ordersdashboard(),
                            cubit.mainOrderModel!.result == []
                                ? Container()
                                : Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "current_shipment".tr(),
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // context.read<MainCubit>().selectedIndex =1;
                                              context
                                                  .read<MainCubit>()
                                                  .onItemTapped(1);
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "see_all".tr(),
                                                  style: TextStyle(
                                                      color: AppColors.gray,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.sp),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: AppColors.gray,
                                                  size: 15.sp,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PackageTrackingCard(
                                      orderModel:
                                          cubit.mainOrderModel!.result!.first,
                                    ),
                                  ])
                          ])
                    ],
                  ),
                ),
        );
      },
    ));
  }

  Widget _buildTrackingCard(OrderModel? model) {
    return Padding(
      padding: EdgeInsets.only(
          right: 10.0.sp, left: 10.0.sp, bottom: 5.sp, top: 5.sp),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 2),
            )
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0.sp),
        ),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(12.0.sp),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.redLight,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Image.asset(
              AppIcons.Box,
            ),
          ),
          title: Text(
            model?.courierLines?.first.toString() ?? '',
            style: TextStyle(
                color: AppColors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          subtitle: Text(model?.name ?? '',
              style: TextStyle(color: AppColors.gray, fontSize: 13.sp)),
          trailing:
              Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.gray),
        ),
      ),
    );
  }
}
