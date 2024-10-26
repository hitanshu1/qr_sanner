import 'package:permission_handler/permission_handler.dart';

/// permission service
class PermissionService {
  PermissionService._();

  /// Checks the current status of the camera permission and requests it if necessary.
  /// 
  /// If the permission is denied, it will prompt the user to grant it. If the 
  /// permission is permanently denied, it will open the app settings to allow 
  /// the user to manually grant the permission.
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
