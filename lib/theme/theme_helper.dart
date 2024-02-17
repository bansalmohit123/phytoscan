import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.errorContainer,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.black900.withOpacity(0.48),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900.withOpacity(0.58),
          fontSize: 16.fSize,
          fontFamily: 'DM Serif Text',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900.withOpacity(0.46),
          fontSize: 15.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 53.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.green90001,
          fontSize: 42.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.lightGreen900,
          fontSize: 35.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 30.fSize,
          fontFamily: 'DM Serif Text',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: appTheme.gray90003,
          fontSize: 28.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.gray90003,
          fontSize: 25.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.lightGreen900,
          fontSize: 22.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF86AB89),
    primaryContainer: Color(0XFF0E3E12),
    secondaryContainer: Color(0XFF5BCE52),

    // Error colors
    errorContainer: Color(0XFF048982),
    onError: Color(0XFF1AC8EF),
    onErrorContainer: Color(0XFF00153D),

    // On colors(text colors)
    onPrimary: Color(0XFF16146B),
    onPrimaryContainer: Color(0XFF000100),
    onSecondaryContainer: Color(0XFF16146C),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFD6D6D6);
  Color get blueGray10001 => Color(0XFFD9D9D9);
  Color get blueGray10002 => Color(0XFFC5D4DC);
  Color get blueGray10003 => Color(0XFFE0CDCD);
  Color get blueGray400 => Color(0XFF7EA187);
  Color get blueGray50 => Color(0XFFECF2F0);
  Color get blueGray700 => Color(0XFF4B5568);
  Color get blueGray70001 => Color(0XFF426D52);
  Color get blueGray900 => Color(0XFF263E30);

  // Cyan
  Color get cyan400 => Color(0XFF12DFD4);
  Color get cyan800 => Color(0XFF28748E);

  // DeepOrange
  Color get deepOrange50 => Color(0XFFF4EAEA);

  // Gray
  Color get gray100 => Color(0XFFF6F4F4);
  Color get gray200 => Color(0XFFEDEDEF);
  Color get gray300 => Color(0XFFE3E3E3);
  Color get gray400 => Color(0XFFB6B6B6);
  Color get gray600 => Color(0XFF5F9163);
  Color get gray900 => Color(0XFF272727);
  Color get gray90001 => Color(0XFF032F15);
  Color get gray90002 => Color(0XFF043318);
  Color get gray90003 => Color(0XFF053418);

  // Green
  Color get green100 => Color(0XFFBDEBC3);
  Color get green400 => Color(0XFF5EDB7D);
  Color get green40001 => Color(0XFF62A072);
  Color get green40002 => Color(0XFF61D064);
  Color get green50 => Color(0XFFE5EEE5);
  Color get green5001 => Color(0XFFE7EFE7);
  Color get green5002 => Color(0XFFE0EFE2);
  Color get green800 => Color(0XFF108431);
  Color get green80001 => Color(0XFF057D37);
  Color get green900 => Color(0XFF09642F);
  Color get green90001 => Color(0XFF1A571F);
  Color get green90002 => Color(0XFF1E4628);
  Color get green90003 => Color(0XFF1B5820);
  Color get green90004 => Color(0XFF185735);
  Color get green90005 => Color(0XFF0F3E12);
  Color get green90006 => Color(0XFF14671B);
  Color get green90007 => Color(0XFF175634);

  // LightBlue
  Color get lightBlueA700 => Color(0XFF0290F7);

  // LightGreenEf
  Color get lightGreen300Ef => Color(0XEFAED893);

  // LightGreen
  Color get lightGreen600 => Color(0XFF69BB38);
  Color get lightGreen900 => Color(0XFF3D6803);
  Color get lightGreenA100 => Color(0XFFB4F68B);
  Color get lightGreenA700 => Color(0XFF57E600);

  // Lime
  Color get lime200 => Color(0XFFE3FFA8);
  Color get limeA200 => Color(0XFFF2FF53);

  // Red
  Color get red600 => Color(0XFFE92828);
  Color get red700 => Color(0XFFE02525);

  // Teal
  Color get tealA400 => Color(0XFF11DFD3);
  Color get tealA40001 => Color(0XFF19EEC7);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);

  // Yellow
  Color get yellowA700 => Color(0XFFEAD305);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();