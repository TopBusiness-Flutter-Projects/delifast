import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utils/app_export.dart';

class Ordersdashboard extends StatelessWidget {
  final List<Map<String, dynamic>> orderData = [
    {
      'color': Colors.red,
      'newOrders': 500,
      'inProgress': 50,
      'progress': 0.5,
      'label': 'inprogress',
    },
    {
      'color': Colors.red,
      'newOrders': 500,
      'inProgress': 400,
      'progress': 0.8,
      'label': 'complete',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h, // Set a fixed height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: orderData.length,
        itemBuilder: (context, index) {
          final data = orderData[index];
          return Container(
            width: 300, // Adjust the width as needed
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: data['color'],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.local_shipping, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'All Orders',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['newOrders']}',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'new order',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['inProgress']}',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data['label'],
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
                //     Spacer(),
                SizedBox(height: 15.h),
                Text(
                  'Progress',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 15.h),
                // Expanded(
                //   child: LinearProgressIndicator(
                //     value: data['progress'],
                //     backgroundColor: Colors.lightBlue,
                //     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                //   ),
                // ),
                LinearPercentIndicator(
                  lineHeight: 10.0,
                  barRadius: Radius.circular(20),
                  percent: .9,
                  backgroundColor: AppColors.white.withOpacity(.5),
                  progressColor: AppColors.white,
                ),
                //   SizedBox(height: 8),
                // Text(
                //   '${(data['progress'] * 100).toInt()}%',
                //   style: TextStyle(color: Colors.white),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
