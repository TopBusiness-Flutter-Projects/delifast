import 'package:delifast/core/utils/app_colors.dart';

import '../../../core/utils/app_export.dart';


import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:  Radius.circular(30)),
                  color: AppColors.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120.w,
       height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color:AppColors.blackblue,

      ),
      child:   Center(
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.location_on_rounded,color:AppColors.red),
              ),
            ),

            Center(
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
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMenuButton(Icons.account_balance_wallet, "Wallet"),
                        _buildMenuButton(Icons.local_shipping, "Pick Up"),
                        _buildMenuButton(Icons.download, "Drop Off"),
                        _buildMenuButton(Icons.history, "History"),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tracking History",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    _buildTrackingCard("iPhone Pro Max 17 2012", "Tracking ID: 94929394"),
                    _buildTrackingCard("MacBook Pro M3", "Tracking ID: 74633747"),
                    // Add more cards as needed
                    SizedBox(height: 24),
                    Text(
                      "Statistics",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Add your statistics section here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String text) {
    return Column(
      children: [
        CircleAvatar(

          radius: 30,
           backgroundColor: Colors.grey[200],

          child: Icon(icon, color: Colors.blue, size: 30),
        ),
        // Container(
        //   width: 30,
        //   height: 30,
        //   decoration:BoxDecoration(shape: BoxShape.circle,borderRadius: BorderRadius.circular(30),color:AppColors.primary)
        //   ,
        // ),
        SizedBox(height: 8),
        Text(text, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildTrackingCard(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.local_shipping, color: Colors.red),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
