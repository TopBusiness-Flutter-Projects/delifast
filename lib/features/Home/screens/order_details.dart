import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/features/Home/screens/widgets/package_order.dart';
import 'package:delifast/features/Home/screens/widgets/shniping_status.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class orderDetails extends StatefulWidget {
  const orderDetails({super.key});

  @override
  _orderDetailsState createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
  String? selectedStatus;
  DateTime? selectedDate;
  final List<String> statusOptions = ['Pending', 'In Progress', 'Delivered', 'Cancelled'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildDateFilter(context),
                    ),
                    Expanded(
                      child: Container(width: 100.w),
                    ),
                  ],
                ),
              ),
              PackageTrackingCard(),
              ShippingStatusWidget(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding:  EdgeInsets.only(top: 20.h),
                  child: Stack(
                     clipBehavior: Clip.none,
                    alignment:  AlignmentDirectional.topCenter,
                    children: [
                      Container(
                       // height: 280.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric( vertical:10.h,horizontal: 20.w ) ,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(AppIcons.location),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Text("Riyadh, Jeddah, The Holy City of Makkah"),
                                  ),


                                ],
                              ),
                            ),
                           ListView.builder(
                             physics:const NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             itemBuilder: (context,index){
                               return Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: CircleAvatar(child: Icon(Icons.account_circle_sharp),),
                                   ),
                                   Text("Clientt1"),
                                 //  Spacer(),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: Image.asset(AppIcons.whatsapp),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: Image.asset(AppIcons.callIcon),
                                   )
                                 ],
                               );
                             },
                             itemCount: 2,
                           ),
                            SizedBox(height: 10.h,),
                            Text("Notes",style:TextStyle(
                                color:AppColors.red,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp
                            )),
                            Text(
                              textAlign: TextAlign.center,
                              "It is a long established fact that a Reader\n will be distracted by the readable content of a pag when looking at its layout." ,maxLines: 3,    overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10.h,),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -10.h,

                        child: Container(
                          alignment: Alignment.topCenter,

                          padding: EdgeInsets.symmetric(horizontal:  20.w,vertical: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              "Clients",
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

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0,),
                child: Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(

                      child: Row(
                        children: [
                          Icon(Icons.camera_alt, color: AppColors.red),
                        SizedBox(width: 2.w,),
                          Flexible(child: Text("Add Photo",style:TextStyle(color:AppColors.red,fontSize: 12.sp))),

                        ],
                      ),
                    ),

                     // SizedBox(width: 10.w,),
                    Flexible(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0.w,),
                        child: Row(

                          children: [
                            Icon(Icons.camera_alt, color: AppColors.red),
                            SizedBox(width: 2.w,),
                            Text("Add Photo",style:TextStyle(color:AppColors.red,fontSize: 12.sp)),

                          ],
                        ),
                      ),
                    ),

// ///
                  ],
                ),
              ),
          SizedBox(height: 10.h,),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items in each row
                  crossAxisSpacing: .0, // Spacing between each item horizontally
                  mainAxisSpacing: 8.0, // Spacing between each item vertically
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        // items[index],
                        "text",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  );
                },
              )
              ]),
        ),
        ));

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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
// class ClientsCard extends StatefulWidget {
//   @override
//   _ClientsCardState createState() => _ClientsCardState();
// }
//
// class _ClientsCardState extends State<ClientsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.location_on_rounded,color:AppColors.red),
//               SizedBox(width: 8.0),
//               Text(
//                 'Riyadh, Jeddah, The Holy City Of Makkah',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16.0),
//           _buildClientCard('Client 1'),
//           SizedBox(height: 16.0),
//           _buildClientCard('Client 2'),
//           SizedBox(height: 32.0),
//           Text(
//             'Notes',
//             style: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 16.0),
//           Text(
//             'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
//             style: TextStyle(
//               fontSize: 16.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildClientCard(String clientName) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 30.0,
//           backgroundImage: AssetImage('assets/client.jpg'), // Replace with actual image asset
//         ),
//         SizedBox(width: 16.0),
//         Expanded(
//           child: Text(
//             clientName,
//             style: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(width: 16.0),
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.message),
//           color: Colors.green,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.call),
//         ),
//       ],
//     );
//   }
// }
//
//
//
// ///
// ///
// ///
// ///
// ///
// ///
// class ClientsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.location_on),
//               SizedBox(width: 8.0),
//               Text(
//                 'Riyadh, Jeddah, The Holy City Of Makkah',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//             ],
//           ),
//           SizedBox(height: 20.0),
//           _buildClientCard('Client 1'),
//           SizedBox(height: 10.0),
//           _buildClientCard('Client 2'),
//           SizedBox(height: 20.0),
//           Text(
//             'Notes',
//             style: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
//             style: TextStyle(fontSize: 14.0),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildClientCard(String clientName) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CircleAvatar(
//             backgroundImage: AssetImage('assets/client.jpg'), // Replace with your client image
//           ),
//           SizedBox(width: 16.0),
//           Text(
//             clientName,
//             style: TextStyle(fontSize: 16.0),
//           ),
//           Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.social_distance),
//                 onPressed: () {
//                   // Handle WhatsApp action
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.phone),
//                 onPressed: () {
//                   // Handle phone call action
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }