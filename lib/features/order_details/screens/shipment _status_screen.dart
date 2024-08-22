import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';


class ShipmentStatus extends StatefulWidget {
  const ShipmentStatus({super.key});

  @override
  _ShipmentStatusState createState() => _ShipmentStatusState();
}

class _ShipmentStatusState extends State<ShipmentStatus> {
  String? selectedStatus;
  DateTime? selectedDate;
  final List<String> statusOptions = ['Pending', 'In Progress', 'Delivered', 'Cancelled'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Column(
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
                            child: Icon(Icons.arrow_back, size: 30.sp, color: AppColors.blackblue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'shipment_status'.tr(),
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                      itemBuilder: (BuildContext context,int inde){
                    return    Padding(
                      padding:  EdgeInsets.only(top: 5.sp,bottom: 5.sp,left: 10.0.sp,right: 10.0.sp),
                      child: Container(
                        // height: 280.h,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text("Mohamed Omar",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),)),
                                  const Text("july 15, 11:30"),

                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Cancel shipment from client"),
                            ),

                          ],
                        ),
                      ),
                    );
                  }),

                ]),
          ),
        ));

  }


}
