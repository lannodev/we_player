import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _lightFillColor = Color(0xFF0B1220);
  static const _darkFillColor = Colors.white;
  static const _errorColor = Color(0xFFff5678);

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  // static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.bold;
  static const _normal = FontWeight.normal;
  static const _w600 = FontWeight.w600;

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      primaryColor: const Color(0xFF030303),
      backgroundColor: colorScheme.background,
      // appBarTheme: AppBarTheme(
      //   textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
      //   color: colorScheme.background,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: colorScheme.primary),
      //   brightness: colorScheme.brightness,
      // ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
      // snackBarTheme: SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Color.alphaBlend(
      //     _lightFillColor.withOpacity(0.80),
      //     _darkFillColor,
      //   ),
      //   contentTextStyle: _textTheme.subtitle1.apply(color: _darkFillColor),
      // ),
    );
  }

  // Light Colors Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFff5678),
    primaryVariant: Color(0xFFff5678),
    secondary: Color(0xFF00CD6B),
    secondaryVariant: Color(0xFF00CD6B),
    background: Color(0xFFFAFBFB),
    surface: Colors.white,
    onBackground: Color(0xFFE6EBEB),
    error: _errorColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: _lightFillColor,
    onSurface: _lightFillColor,
    brightness: Brightness.light,
  );

  // Dark Colors Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFff5678),
    primaryVariant: Color(0xFFff5678),
    secondary: Color(0xFF00CD6B),
    secondaryVariant: Color(0xFF00CD6B),
    background: Color(0xFF0B1220),
    surface: Color(0xFF111727),
    onBackground: Color(0xFF141b2d),
    error: _errorColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static final TextTheme _textTheme = TextTheme(
    headline4: TextStyle(fontWeight: _bold, fontSize: 28.0),
    headline5: TextStyle(fontWeight: _w600, fontSize: 20.0),
    headline6: TextStyle(fontWeight: _normal, fontSize: 18.0),
    subtitle1: TextStyle(fontWeight: _bold, fontSize: 14.0),
    subtitle2: TextStyle(fontWeight: _w600, fontSize: 12.0),
    button: TextStyle(fontWeight: _normal, fontSize: 12.0),
  );
}
