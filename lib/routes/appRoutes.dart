import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/home/page.dart';


/// app routes
class AppRoutes {
  AppRoutes._();

  /// initial route
  static const String initialRoute = '/';

  /// payment page
  static const String payment = '/payment';

  /// dashboard page
  static const String dashboard = '/dashboard';

  static const String userDetails = '/userDetails';

  /// Generates a route based on the given [RouteSettings].
  ///
  /// The [settings] parameter contains the name of the route to be generated.
  /// The function returns a [Route] object that represents the generated route.
  ///
  /// The function uses a switch statement to determine the type of route to be generated based on the [settings.name].
  /// If the [settings.name] is equal to [initialRoute], it returns a [MaterialPageRoute] that builds a [const AuthBuilder].
  /// If the [settings.name] does not match any of the above cases, it returns a [MaterialPageRoute] that builds a [Scaffold] with a [Center] widget displaying the text 'Unknown route: ${settings.name}'.
  ///
  /// Parameters:
  /// - `settings` (RouteSettings): The settings for the route to be generated.
  ///
  /// Returns:
  /// - `Route<dynamic>`: The generated route.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Uri uri = Uri.parse(settings.name!); // Parse the route name as a Uri
    final String routeName = uri.path;
    switch (routeName) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Unknown route: ${settings.name}')),
          ),
        );
    }
  }
}
