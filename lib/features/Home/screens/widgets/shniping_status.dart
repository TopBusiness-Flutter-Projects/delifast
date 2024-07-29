import 'package:flutter/material.dart';

class ShippingStatusWidget extends StatelessWidget {
  const ShippingStatusWidget({super.key});

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
                  // Handle 'See all' action
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
        _buildStatusItem('New', true, '5/7/2024 11:52'),
        _buildStatusItem('In Progress', false, ''),
        _buildStatusItem('Delivered', false, ''),
        _buildStatusItem('Cancel', false, ''),
      ],
    );
  }

  Widget _buildStatusItem(String status, bool isActive, String date) {
    return Padding(
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
          SizedBox(width: 16),
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
    );
  }
}