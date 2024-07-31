import 'package:delifast/core/utils/app_export.dart';
import 'package:flutter/material.dart';

class ShippingStatusWidget extends StatefulWidget {
  const ShippingStatusWidget({super.key});

  @override
  _ShippingStatusWidgetState createState() => _ShippingStatusWidgetState();
}

class _ShippingStatusWidgetState extends State<ShippingStatusWidget> {
  String _selectedStatus = 'New';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Status',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.shipmentRoutes);
                },
                child: Text(
                  'See all >',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildStatusItem('New', 'New', '5/7/2024 11:52'),
        _buildStatusItem('In Progress', 'In Progress', ''),
        _buildStatusItem('Delivered', 'Delivered', ''),
        _buildStatusItem('Cancel', 'Cancel', ''),
      ],
    );
  }

  Widget _buildStatusItem(String status, String statusKey, String date) {
    bool isActive = _selectedStatus == statusKey;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStatus = statusKey;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Colors.green : Colors.transparent,
                border: Border.all(
                  color: isActive ? Colors.green : Colors.grey,
                  width: 2,
                ),
              ),
              child: isActive
                  ? Icon(Icons.check, color: Colors.white, size: 16)
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
            Spacer(),
            if (isActive)
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
