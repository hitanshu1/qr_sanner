import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/navigationService.dart';
import '../../../core/utils/permission.dart';
import '../../../routes/appRoutes.dart';

/// home page
class HomePage extends StatefulWidget {
  /// constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  /// qr controller
  QRViewController? controller;
  /// to view qr code resultText used in home page
  String resultText = 'Scan a QR code';

  @override
  /// Checks and requests camera permission when this widget is initialized.
  /// See [PermissionService.checkAndRequestCameraPemmission].
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
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        actions: [
          TxtButton(
            text: AppStrings.generateQrCode,
            color: Colorz.primary,
            onPressed: () {
              NavigatorService.pushNamed(AppRoutes.generateQrCode);
            },
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
  /// Disposes of the QR view controller when the widget is disposed.
  ///
  /// This is necessary to prevent memory leaks when the widget is removed from the
  /// widget tree.
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
