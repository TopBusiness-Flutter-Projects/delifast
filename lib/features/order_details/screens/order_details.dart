// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/features/order_details/screens/widget/shniping_status.dart';
import 'package:delifast/features/order_details/screens/widget/shipment_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../core/models/order_model.dart';
import '../cubit/order_details_cubit.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({super.key, this.orderModel});
  OrderModel? orderModel;
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String? selectedStatus;
  DateTime? selectedDate;

  // TextEditingController EmailController = TextEditingController();
  @override
  void initState() {
    context.read<OrderDetailsCubit>().getStateOfOrderDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      var cubit = context.read<OrderDetailsCubit>();

      return SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  'detailsOrder'.tr(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: state is LoadingGetState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      ShipmentWidget(
                        model: widget.orderModel,
                      ),
                      ShippingStatusWidget(
                        model: widget.orderModel,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5.sp,
                            left: 10.sp,
                            right: 10.sp,
                            bottom: 20.sp),
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                // height: 280.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10.sp),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                Image.asset(AppIcons.location),
                                          ),
                                          Flexible(
                                              child: Text(
                                            widget.orderModel?.senderStreet ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.black
                                                    .withOpacity(0.8)),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                        ],
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: CircleAvatar(
                                            child: Icon(
                                                Icons.account_circle_sharp),
                                          ),
                                        ),
                                        Text(widget.orderModel?.receiverName ??
                                            ''),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            launchWhatsApp(widget
                                                    .orderModel?.receiverMobile
                                                    .toString() ??
                                                '000');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child:
                                                Image.asset(AppIcons.whatsapp),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            makePhoneCall(widget
                                                    .orderModel?.receiverMobile
                                                    .toString() ??
                                                '000');
                                            // widget.orderModel?.senderMobile;
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child:
                                                Image.asset(AppIcons.callIcon),
                                          ),
                                        )
                                      ],
                                    ),
                                    // ListView.builder(
                                    //   physics: const NeverScrollableScrollPhysics(),
                                    //   shrinkWrap: true,
                                    //   itemBuilder: (context, index) {
                                    //     return Row(
                                    //       children: [
                                    //         const Padding(
                                    //           padding: EdgeInsets.all(10.0),
                                    //           child: CircleAvatar(
                                    //             child:
                                    //                 Icon(Icons.account_circle_sharp),
                                    //           ),
                                    //         ),
                                    //         const Text("Clientt1"),
                                    //         const Spacer(),
                                    //         Padding(
                                    //           padding: const EdgeInsets.all(10.0),
                                    //           child: Image.asset(AppIcons.whatsapp),
                                    //         ),
                                    //         Padding(
                                    //           padding: const EdgeInsets.all(10.0),
                                    //           child: Image.asset(AppIcons.callIcon),
                                    //         )
                                    //       ],
                                    //     );
                                    //   },
                                    //   itemCount: 2,
                                    // ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    widget.orderModel?.notes == false
                                        ? Container()
                                        : Text("Notes",
                                            style: TextStyle(
                                                color: AppColors.red,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.sp)),
                                    widget.orderModel?.notes == false
                                        ? Container()
                                        : Padding(
                                            padding: EdgeInsets.all(10.0.sp),
                                            child: HtmlWidget(
                                              widget.orderModel?.notes ?? '',
                                            ),
                                          ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -10.h,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 3.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.red,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Client",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 16.0,
                      //   ),
                      //   child: Row(
                      //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Flexible(
                      //         child: InkWell(
                      //           onTap: () async {
                      //             cubit.pickLogoImage();
                      //           },
                      //           child: Row(
                      //             children: [
                      //               Icon(Icons.camera_alt, color: AppColors.red),
                      //               SizedBox(
                      //                 width: 2.w,
                      //               ),
                      //               Flexible(
                      //                   child: Text("Add Photo",
                      //                       style: TextStyle(
                      //                           color: AppColors.red,
                      //                           fontSize: 12.sp))),
                      //             ],
                      //           ),
                      //         ),
                      //       ),

                      //       // SizedBox(width: 10.w,),
                      //       // Flexible(
                      //       //   child: Row(
                      //       //     children: [
                      //       //       Icon(Icons.note_alt, color: AppColors.red),
                      //       //       //    Flexible(child: Image.asset(AppImages.location)),
                      //       //       SizedBox(
                      //       //         width: 2.w,
                      //       //       ),
                      //       //       Flexible(
                      //       //           child: InkWell(
                      //       //               onTap: () {
                      //       //                 showModalBottomSheet(
                      //       //                   context: context,
                      //       //                   isScrollControlled:
                      //       //                       true, // This is important to make the bottom sheet adjustable
                      //       //                   builder: (BuildContext context) {
                      //       //                     return Container(
                      //       //                       // height:
                      //       //                       // MediaQuery.of(context).size.width * 1.4,
                      //       //                       padding: EdgeInsets.only(
                      //       //                         left: 16.0,
                      //       //                         right: 16.0,
                      //       //                         top: 16.0,
                      //       //                         bottom: MediaQuery.of(context)
                      //       //                                 .viewInsets
                      //       //                                 .bottom +
                      //       //                             16.0, // Adjust padding to account for the keyboard
                      //       //                       ),
                      //       //                       child: Column(
                      //       //                         mainAxisSize: MainAxisSize.min,
                      //       //                         children: [
                      //       //                           Padding(
                      //       //                             padding:
                      //       //                                 const EdgeInsets.all(3.0),
                      //       //                             child: TextField(
                      //       //                               maxLines: 4,
                      //       //                               controller: EmailController,
                      //       //                               onSubmitted:
                      //       //                                   (data) async {},
                      //       //                               decoration: InputDecoration(
                      //       //                                 hintText:
                      //       //                                     "SendMessage".tr(),
                      //       //                                 filled: true,

                      //       //                                 fillColor: Colors.grey[
                      //       //                                     200], // Set the background color to grey
                      //       //                                 contentPadding:
                      //       //                                     const EdgeInsets
                      //       //                                         .symmetric(
                      //       //                                   vertical: 10,
                      //       //                                   horizontal: 15,
                      //       //                                 ), // Adjust the content padding
                      //       //                                 border:
                      //       //                                     OutlineInputBorder(
                      //       //                                   borderRadius:
                      //       //                                       BorderRadius
                      //       //                                           .circular(15),
                      //       //                                   borderSide: BorderSide
                      //       //                                       .none, // Remove the border color
                      //       //                                 ),
                      //       //                               ),
                      //       //                             ),
                      //       //                           ),
                      //       //                           SizedBox(height: 20.sp),
                      //       //                           // ElevatedButton(
                      //       //                           //   onPressed: () {},
                      //       //                           //   child: Text('SendReply'.tr()),
                      //       //                           // ),
                      //       //                           CustomButton(
                      //       //                             text: "addNotes".tr(),
                      //       //                             onPressed: () {},
                      //       //                             width: 100.w,
                      //       //                           )
                      //       //                         ],
                      //       //                       ),
                      //       //                     );
                      //       //                   },
                      //       //                 );
                      //       //               },
                      //       //               child: Text("addNotes".tr(),
                      //       //                   style: TextStyle(
                      //       //                       color: AppColors.red,
                      //       //                       fontSize: 12.sp)))),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       //
                      //       // ///
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      // GridView.builder(
                      //   physics:
                      //       const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                      //   shrinkWrap: true,
                      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2, // Number of items in each row
                      //     crossAxisSpacing:
                      //         10, // Spacing between each item horizontally
                      //     mainAxisSpacing: 10, // Spacing between each item vertically
                      //   ),
                      //   itemCount: 3,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return const CustomNoteWidget(
                      //       isText: false,
                      //     );
                      //   },
                      // )
                    ],
                  ),
          )
        ]),
      ));
    });

    // Method to launch WhatsApp with a specific phone number
  }

  Future<void> launchWhatsApp(String phoneNumber) async {
    final whatsappUrl = 'https://wa.me/$phoneNumber';
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final telUrl = 'tel:$phoneNumber';
    if (await canLaunch(telUrl)) {
      await launch(telUrl);
    } else {
      throw 'Could not make a phone call to $phoneNumber';
    }
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                  : 'Date Filter',
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
