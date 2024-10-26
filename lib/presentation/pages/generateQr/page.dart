import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';

/// generate qr code
class QrCodeGeneratorPage extends StatefulWidget {
  /// constructor
  const QrCodeGeneratorPage({super.key});

  @override
  State<QrCodeGeneratorPage> createState() => _QrCodeGeneratorPageState();
}

class _QrCodeGeneratorPageState extends State<QrCodeGeneratorPage> {
  /// qrCode used for generate qr code
  String? qrCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.generateQrCode),
      ),
      body: Padding(
        padding: SizeConfig.pagePadding,
        child: ListView(
          
          children: [
            Widgets.heading(text: AppStrings.enterTextToGenerateQrCode),
            SizeConfig.verticalSpace(),
            _qrTextField(),
            SizeConfig.verticalSpace(),
            if (qrCode == null) const SizedBox() else _qrCodeView(),
            SizeConfig.verticalSpace(),
            
        
          ],),
      )
    );
  }

  /// A TextField to input the QR code content.
  ///
  /// When the user input some text, it will generate a QR code and display it.
  /// If the user input nothing, it will not generate a QR code.
  Widget _qrTextField() {
    return TxtField(
      text: qrCode,
      hintText: AppStrings.enterText,
      onChanged: (val) {
        setState(() {
          qrCode = val;
        });
      },
    );
  }
 
/// Creates a widget that displays a QR code centered on the screen.
///
/// The QR code is generated using the current value of `qrCode` and is displayed
/// with a fixed size of 200x200 pixels.
  Widget _qrCodeView() {
    return Center(
      child: QrImageView(
        data: qrCode!,
        size: 200.0,
      ),
    );
  }
}
