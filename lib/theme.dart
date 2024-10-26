import 'package:flutter/material.dart';

import 'core/constants/constants.dart';

/// Returns a `ThemeData` object based on the provided `isDark` parameter.
///
/// Parameters:
/// - `isDark`: A boolean value that determines the brightness of the theme.
///
/// Returns:
/// - A `ThemeData` object with the specified brightness, primary color, and various other theme properties.
ThemeData theme(bool isDark) {
   final Color primary = Colorz.blue;
   final Color foregroundColor = Colorz.blue;
  
   final Color  appBarColor = isDark ? Colorz.black : Colorz.white;
  final WidgetStateProperty<Color?> _property =
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return null;
    }
    if (states.contains(WidgetState.selected)) {
      return primary;
    }
    return null;
  });
  final ThemeData data = isDark
      ? ThemeData.dark(useMaterial3: false)
      : ThemeData.light(useMaterial3: false);
  return data.copyWith(
      brightness: Brightness.light,
      primaryColor: Colorz.blue,
      bottomAppBarTheme: BottomAppBarTheme(
        color: appBarColor
      ),
      
      appBarTheme: AppBarTheme(
        
        foregroundColor: foregroundColor,
        color: appBarColor,
        iconTheme: const IconThemeData(color: Colors.black),
        
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: SizeConfig.largeFont,
                fontWeight: FontWeight.bold,
                color: Colorz.black,
            ),
      ),
      switchTheme:
          SwitchThemeData(thumbColor: _property, trackColor: _property),
      radioTheme: RadioThemeData(fillColor: _property),
      checkboxTheme: CheckboxThemeData(fillColor: _property),
      floatingActionButtonTheme:  FloatingActionButtonThemeData(
          foregroundColor: foregroundColor, backgroundColor: primary));
}
