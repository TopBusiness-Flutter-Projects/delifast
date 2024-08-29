import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/features/orders/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/models/get_states_model.dart';
import '../../../core/widgets/package_order.dart';
import '../cubit/cubit.dart';

class OrderScreenHome extends StatefulWidget {
  OrderScreenHome({super.key, required this.stateId});
  String? stateId;
  @override
  _OrderScreenHomeState createState() => _OrderScreenHomeState();
}

class _OrderScreenHomeState extends State<OrderScreenHome> {
  // String? selectedStatus;

  DateTime? selectedDate;
  StateModel? stateModel;

  final List<StateModel> statusOptions = [
    // 'Pending',
    // 'In Progress',
    // 'Delivered',
    // 'Cancelled'
  ];
  @override
  void initState() {
    print('eeeeeeeeeeeeeeeee${widget.stateId.toString()}');
    context
        .read<OrdersCubit>()
        .getOrders(state: widget.stateId.toString(), isFilter: true);

    for (int i = 0;
        i < context.read<OrdersCubit>().getStatesModel!.result!.length;
        i++) {
      stateModel = context.read<OrdersCubit>().getStatesModel!.result![i];

      statusOptions.add(context.read<OrdersCubit>().getStatesModel!.result![i]);
      setState(() {});
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      var cubit = context.read<OrdersCubit>();
      return SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            cubit.getOrders(state: widget.stateId.toString(), isFilter: true);
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: cubit.mainOrderModelFilter == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
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
                        child: cubit.mainOrderModelFilter?.result == []
                            ? Center(child: Text('no_data'.tr()))
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.ordersDetailsRoutes,
                                            arguments: cubit
                                                .mainOrderModelFilter
                                                ?.result?[index]);
                                      },
                                      child: PackageTrackingCard(
                                        isFilter: true,
                                        index: index,
                                        orderModel: cubit.mainOrderModelFilter
                                            ?.result?[index],
                                      ));
                                },
                                itemCount:
                                    cubit.mainOrderModelFilter?.result?.length,
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
      child: DropdownButton<StateModel>(
        isExpanded: true,
        value: stateModel,
        hint: Text("status_filter".tr(),
            style: TextStyle(color: Colors.grey[600], fontSize: 14.sp)),
        underline: const SizedBox(),
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
        onChanged: (StateModel? newValue) {
          setState(() {
            stateModel = newValue;

            context
                .read<OrdersCubit>()
                .getOrders(state: stateModel?.id.toString(), isFilter: true);
          });
        },

        ///j
        items:
            statusOptions.map<DropdownMenuItem<StateModel>>((StateModel value) {
          return DropdownMenuItem<StateModel>(
            value: value,
            child: Text(value.name ?? ''),
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
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}
