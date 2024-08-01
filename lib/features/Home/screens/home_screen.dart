import 'package:delifast/core/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:delifast/core/utils/app_colors.dart';
import 'package:delifast/features/Home/screens/pick_up.dart';
import 'package:delifast/features/Home/screens/widgets/buttons_container.dart';
import 'package:delifast/features/Home/screens/widgets/order_shared.dart';
import 'package:delifast/features/Home/screens/widgets/package_order.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../core/utils/assets_manager.dart';
import '../wallet/screens/wallet_screen.dart';
import 'drop_off.dart';
import 'order_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> _options = [
    {'icon': AppImages.walletPhoto, 'label': 'Wallet', 'screen': WalletScreen()},
    {'icon': AppIcons.Truck, 'label': 'Pick Up', 'screen': PickUpScreen()},
    {'icon': AppIcons.Drops, 'label': 'Drop Off', 'screen': DropOffScreen()},
    {'icon': AppIcons.History, 'label': 'History', 'screen': OrderScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  color: AppColors.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: AppColors.blackblue,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.location_on_rounded, color: AppColors.red),
                            ),
                            Expanded(
                              child: Text(
                                'Abu Dhabi, UAE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      "Let's track your package",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Please enter your tracking number",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter tracking number",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Icon(Icons.qr_code_scanner, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _options.length,
                      itemBuilder: (context, index) {
                        final option = _options[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => option['screen']),
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
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tracking History",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "See all",
                              style: TextStyle(
                                color: AppColors.gray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: AppColors.gray),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 150.0.h,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return _buildTrackingCard(
                          "iPhone Pro Max 17 2012",
                          "Tracking ID: 94929394",
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Statistics",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Ordersdashboard(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Current Shipment",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  PackageTrackingCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackingCard(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.redLight,
          ),
          child: Image.asset(
            AppIcons.Box,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: AppColors.primary, fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: AppColors.gray, fontSize: 13.sp)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.gray),
      ),
    );
  }
}
