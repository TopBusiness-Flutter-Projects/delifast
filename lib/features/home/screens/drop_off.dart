// import 'package:delifast/core/utils/app_export.dart';
// import 'package:easy_localization/easy_localization.dart';
// import '../../order_details/screens/widget/shipment_widget.dart';

// class DropOffScreen extends StatefulWidget {
//   const DropOffScreen({super.key});

//   @override
//   _DropOffScreenState createState() => _DropOffScreenState();
// }

// class _DropOffScreenState extends State<DropOffScreen> {
//   String? selectedStatus;
//   DateTime? selectedDate;

//   final List<String> statusOptions = [
//     'Pending',
//     'In Progress',
//     'Delivered',
//     'Cancelled'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.white,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Icon(Icons.arrow_back,
//                             size: 30.sp, color: AppColors.blackblue)),
//                   ),
//                   Text(
//                     'dropOff'.tr(),
//                     style: TextStyle(
//                       fontSize: 24.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildDateFilter(context),
//                   ),
//                   Expanded(
//                     child: Container(
//                       width: 100.w,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return ShipmentWidget(

//                   );
//                 },
//                 itemCount: 3,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDateFilter(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final DateTime? picked = await showDatePicker(
//           context: context,
//           initialDate: selectedDate ?? DateTime.now(),
//           firstDate: DateTime(2000),
//           lastDate: DateTime(2025),
//         );
//         if (picked != null && picked != selectedDate) {
//           setState(() {
//             selectedDate = picked;
//           });
//         }
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey[300]!),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               selectedDate != null
//                   ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
//                   : "data_filter".tr(),
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 16.sp,
//               ),
//             ),
//             Icon(
//               Icons.calendar_today,
//               color: Colors.grey[600],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
