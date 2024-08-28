import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:delifast/core/utils/app_colors.dart';
import 'package:delifast/features/order_details/screens/order_details.dart';
import 'package:flutter/material.dart';

class DeliveredScreen extends StatefulWidget {
  const DeliveredScreen({super.key});

  @override
  State<DeliveredScreen> createState() => _DeliveredScreenState();
}

class _DeliveredScreenState extends State<DeliveredScreen> {
  String barcode = 'Tap to scan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Scan Barcode'),
              onPressed: () async {
                final String? scannedValue = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AiBarcodeScanner(
                      onScan: (p0) {},
                      onDispose: () {
                        debugPrint("Barcode scanner disposed!");
                      },
                      controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed.noDuplicates,
                      ),
                      onDetect: (BarcodeCapture capture) {
                        final String? scannedValue =
                            capture.barcodes.first.rawValue;
                        debugPrint("Barcode scanned: $scannedValue");

                        // Update the barcode value and pop back to the previous screen
                        Navigator.of(context).pop(scannedValue);
                      },
                    ),
                  ),
                );

                // If a barcode was scanned, update the UI
                if (scannedValue != null) {
                  setState(() {
                    barcode = scannedValue;
                  });
                }
              },
            ),
            GestureDetector(
                onTap: () {
                  //!
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetails(

                              // barcode: barcode,
                              )));
                },
                child: Text(barcode)),
          ],
        ),
      ),
    );
  }
}
