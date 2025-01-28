import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';


class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  bool isBarcodeDetected = false;
  String? detectedBarcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Barcode Scanner')),
      body: Stack(
        children: [
          MobileScanner(
            // onDetect: (barcode, args) {
            //   if (barcode.barcodes.isNotEmpty && !isBarcodeDetected) {
            //     setState(() {
            //       isBarcodeDetected = true;
            //       detectedBarcode =
            //           barcode.barcodes.first.rawValue ?? 'Unknown';
            //     });
            //   }
            // },
          ),
          if (isBarcodeDetected)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BarcodeResultScreen(barcode: detectedBarcode!),
                      ),
                    );
                  },
                  child: Text('Search'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BarcodeResultScreen extends StatelessWidget {
  final String barcode;

  BarcodeResultScreen({required this.barcode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Barcode Result')),
      body: Center(
        child: Text(
          'Barcode: $barcode',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}




