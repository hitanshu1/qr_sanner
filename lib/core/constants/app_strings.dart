part of 'constants.dart';

/// app Strings
class AppStrings {
  AppStrings._();

  /// string for profile
  static String profile = 'Profile';

  /// string for explore
  static String explore = 'Explore';

  /// String service
  static String services = 'Services';

  static String paymentStatus({bool? paid, bool? verified}) {
    if (verified ?? false) {
      return 'Success';
    } else {
      if (paid ?? false) {
        return 'Verification Pending';
      } else {
        return 'Not Paid';
      }
    }
  }

  /// payee name
  static String payee = "ST. MARY'S HIGHER SECONDARY SCHOOL, DIBRUGARH";

  static String shareText = 'Get Your pass'
      '\n\n for 75 Anniversary of $payee.\n\n'
      "_📲 Install now\n\n"
      " Download Link👇\n\n"
      "https://drive.google.com/file/d/1SIeNhqJbUETcR2CYc7ExjPRXhPRj7vao/view?usp=sharing"
      "\n\n";
}
