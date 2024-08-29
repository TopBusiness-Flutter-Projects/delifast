import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/features/order_details/cubit/order_details_cubit.dart';
import 'package:delifast/features/orders/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/models/order_model.dart';

class ShippingStatusWidget extends StatefulWidget {
  ShippingStatusWidget({super.key, this.model});

  OrderModel? model;
  @override
  _ShippingStatusWidgetState createState() => _ShippingStatusWidgetState();
}

class _ShippingStatusWidgetState extends State<ShippingStatusWidget> {
  @override
  void initState() {
    context.read<OrderDetailsCubit>().selectedStatus = widget.model?.stateName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        var cubit = context.read<OrderDetailsCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'shipping_status'.tr(),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.shipmentRoutes);
                    },
                    child: const Text(
                      'See all >',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cubit.states?.result?.length,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                var item = cubit.states?.result?[index];
                return _buildStatusItem(
                    item?.name ?? '',
                    item?.name ?? '',
                    widget.model!,
                    item!.id!,
                    widget.model!.id.toString(),
                    item.id == 1
                        ? widget.model!.newStDate == false
                            ? ''
                            : widget.model!.newStDate.toString()
                        : item.id == 2
                            ? widget.model!.collectedStDate == false
                                ? ''
                                : widget.model!.collectedStDate.toString()
                            : item.id == 3
                                ? widget.model!.dispatchedStDate == false
                                    ? ''
                                    : widget.model!.dispatchedStDate.toString()
                                : item.id == 4
                                    ? widget.model!.inTransitStDate == false
                                        ? ''
                                        : widget.model!.inTransitStDate
                                            .toString()
                                    : item.id == 5
                                        ? widget.model!.arrivedStDate == false
                                            ? ''
                                            : widget.model!.arrivedStDate
                                                .toString()
                                        : item.id == 6
                                            ? widget.model!
                                                        .outOfDeliveryStDate ==
                                                    false
                                                ? ''
                                                : widget
                                                    .model!.outOfDeliveryStDate
                                                    .toString()
                                            : item.id == 7
                                                ? widget.model!
                                                            .deliveredStDate ==
                                                        false
                                                    ? ''
                                                    : widget
                                                        .model!.deliveredStDate
                                                        .toString()
                                                : item.id == 8
                                                    ? widget.model!
                                                                .cancelledStDate ==
                                                            false
                                                        ? ''
                                                        : widget.model!
                                                            .cancelledStDate
                                                            .toString()
                                                    : "");
              },
            )
          ],
        );
      },
    );
  }

  Widget _buildStatusItem(String status, String statusKey, OrderModel date,
      int stateId, String orderId, String dateTime) {
    bool isActive =
        context.read<OrderDetailsCubit>().selectedStatus == statusKey;

    return GestureDetector(
      onTap: () {
        print(
            'xxxxxxxxxxx${DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now())}');
        setState(() {
          context.read<OrderDetailsCubit>().updateOrder(
              orderId,
              DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()),
              stateId,
              context);
          //! api of change state then set current value
          context.read<OrderDetailsCubit>().selectedStatus = statusKey;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Colors.green : Colors.transparent,
                border: Border.all(
                  color: isActive ? Colors.green : Colors.grey,
                  width: 2,
                ),
              ),
              child: isActive
                  ? Icon(Icons.check, color: Colors.white, size: 16.sp)
                  : null,
            ),
            SizedBox(width: 16.w),
            Text(
              status,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? Colors.green : Colors.black,
              ),
            ),
            const Spacer(),
            // if (isActive)
            Text(
              dateTime,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
