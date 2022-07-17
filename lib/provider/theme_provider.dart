import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';

// class ThemeManager with ChangeNotifier {
//   ThemeMode _themeMode = ThemeMode.light;
//   get themeMode => _themeMode;
//   toggleThem(bool isDark) {
//     _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
//     notifyListeners();
//   }
// }

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorApp.black,
      colorScheme: ColorScheme.dark(),
      primaryColor: Colors.black);
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorApp.backgroundApp,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
}
