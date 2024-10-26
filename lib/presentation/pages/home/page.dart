import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/permission.dart';

/// home page
class HomePage extends StatefulWidget {
  /// constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String resultText = 'Scan a QR code';

  @override
  void initState() {
    PermissionService.checkAndRequestCameraPemmission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Txt(
          AppStrings.home,
          color: Colorz.black,
        ),
        actions: [
         TxtButton(
          text: AppStrings.generateQrCode,

         )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            
            child: Center(
              child: Txt(
                resultText,
                color: Colorz.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
/// Initializes the QR view by setting the controller and listening to the scanned data stream.
/// 
/// When a QR code is scanned, the `resultText` is updated with the scanned code.
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        resultText = scanData.code!;
      });
    });
  }

  @override 
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
