import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/features/orders/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/widgets/package_order.dart';
import '../cubit/cubit.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.isInMainScreen});
  final bool isInMainScreen;
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? selectedStatus;
  DateTime? selectedDate;
//
  final List<String> statusOptions = [
    'Pending',
    'In Progress',
    'Delivered',
    'Cancelled'
  ];
  @override
  void initState() {
    context.read<OrdersCubit>().getOrders(isFilter: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      var cubit = context.read<OrdersCubit>();
      return SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            cubit.getOrders(isFilter: false);
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    widget.isInMainScreen
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.primary,
                            )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'orders'.tr(),
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildStatusFilter(),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _buildDateFilter(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.ordersDetailsRoutes,
                                arguments:
                                    cubit.mainOrderModel?.result?[index]);
                          },
                          child: PackageTrackingCard(
                            isFilter: false,
                            index: index,
                            orderModel: cubit.mainOrderModel?.result?[index],
                          ));
                    },
                    itemCount: cubit.mainOrderModel?.result?.length,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildStatusFilter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(50.sp),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedStatus,
        hint: Text("status_filter".tr(),
            style: TextStyle(color: Colors.grey[600], fontSize: 14.sp)),
        underline: const SizedBox(),
        icon: Icon(Icons.arrow_drop_down, size: 20, color: Colors.grey[600]),
        onChanged: (String? newValue) {
          setState(() {
            selectedStatus = newValue;
          });
        },

        ///j
        items: statusOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDateFilter(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025),
        );
        if (picked != null && picked != selectedDate) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 10.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                  : "data_filter".tr(),
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16.sp,
              ),
            ),
            Icon(
              Icons.calendar_today,
              size: 20,
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}
