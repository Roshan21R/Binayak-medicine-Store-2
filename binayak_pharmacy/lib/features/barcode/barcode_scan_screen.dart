import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScanScreen extends StatelessWidget {
  const BarcodeScanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: Stack(
        children: [
          MobileScanner(onDetect: (capture) {
            final codes = capture.barcodes;
            if (codes.isNotEmpty) {
              Navigator.of(context).pop(codes.first.rawValue);
            }
          }),
          const Align(
            alignment: Alignment.center,
            child: Icon(Icons.crop_free, size: 200, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}