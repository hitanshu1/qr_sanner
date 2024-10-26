import 'package:permission_handler/permission_handler.dart';

/// permission service
class PermissionService {
  PermissionService._();
/// check and request camera permission
  static Future<void> checkAndRequestCameraPemmission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      return;
    }
    if (status.isDenied) {
      await Permission.camera.request();
    }
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
