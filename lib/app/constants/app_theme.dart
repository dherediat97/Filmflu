import 'package:flutter/material.dart';

class AppTheme {
  final TextTheme textTheme;

  const AppTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffE6132B),
      surfaceTint: Color(0xffbe071d),
      onPrimary: Color(0xFFffffff),
      primaryContainer: Color(0xffd42029),
      onPrimaryContainer: Color(0x8BF9F9F9),
      secondary: Color(0x00010f0f),
      onSecondary: Color(0xFFEAEAEB),
      secondaryContainer: Color(0xffd42029),
      onSecondaryContainer: Color(0x8BF9F9F9),
      tertiary: Color(0xffE6132B),
      onTertiary: Color(0x8BF9F9F9),
      tertiaryContainer: Color(0xffd42029),
      onTertiaryContainer: Color(0x8BF9F9F9),
      error: Color(0xff320004),
      onError: Color(0x8BF9F9F9),
      errorContainer: Color(0xff670f17),
      onErrorContainer: Color(0xffffacaa),
      surface: Color(0x8BF9F9F9),
      onSurface: Color(0xff1b1b1b),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c8),
      shadow: Color(0x00010f0f),
      scrim: Color(0x00010f0f),
      inverseSurface: Color(0xff303030),
      inversePrimary: Color(0xffffb3ad),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff410004),
      primaryFixedDim: Color(0xffffb3ad),
      onPrimaryFixedVariant: Color(0xff930012),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff410004),
      secondaryFixedDim: Color(0xffffb3ad),
      onSecondaryFixedVariant: Color(0xff930012),
      tertiaryFixed: Color(0xffffdad7),
      onTertiaryFixed: Color(0xff410004),
      tertiaryFixedDim: Color(0xffffb3ad),
      onTertiaryFixedVariant: Color(0xff930012),
      surfaceDim: Color(0xffdadada),
      surfaceBright: Color(0xfff9f9f9),
      surfaceContainerLowest: Color(0x8BF9F9F9),
      surfaceContainerLow: Color(0xfff3f3f3),
      surfaceContainer: Color(0xffeeeeee),
      surfaceContainerHigh: Color(0xffe8e8e8),
      surfaceContainerHighest: Color(0xffe2e2e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4d0006),
      surfaceTint: Color(0xffbe071d),
      onPrimary: Color(0x8BF9F9F9),
      primaryContainer: Color(0xffd42029),
      onPrimaryContainer: Color(0x8BF9F9F9),
      secondary: Color(0x00010f0f),
      onSecondary: Color(0x8BF9F9F9),
      secondaryContainer: Color(0xffd42029),
      onSecondaryContainer: Color(0x8BF9F9F9),
      tertiary: Color(0xff8b0010),
      onTertiary: Color(0x8BF9F9F9),
      tertiaryContainer: Color(0xffd42029),
      onTertiaryContainer: Color(0x8BF9F9F9),
      error: Color(0xff320004),
      onError: Color(0x8BF9F9F9),
      errorContainer: Color(0xff670f17),
      onErrorContainer: Color(0xffffeceb),
      surface: Color(0xfff9f9f9),
      onSurface: Color(0x8BF9F9F9),
      onSurfaceVariant: Color(0x00010f0f),
      outline: Color(0xff5c6060),
      outlineVariant: Color(0xff787b7c),
      shadow: Color(0x00010f0f),
      scrim: Color(0x00010f0f),
      inverseSurface: Color(0xff303030),
      inversePrimary: Color(0xffffb3ad),
      primaryFixed: Color(0xffdf2a30),
      onPrimaryFixed: Color(0x8BF9F9F9),
      primaryFixedDim: Color(0xffbb021a),
      onPrimaryFixedVariant: Color(0x8BF9F9F9),
      secondaryFixed: Color(0xffdf2a30),
      onSecondaryFixed: Color(0x8BF9F9F9),
      secondaryFixedDim: Color(0xffbb021a),
      onSecondaryFixedVariant: Color(0x8BF9F9F9),
      tertiaryFixed: Color(0xffdf2a30),
      onTertiaryFixed: Color(0x8BF9F9F9),
      tertiaryFixedDim: Color(0xffbb021a),
      onTertiaryFixedVariant: Color(0x8BF9F9F9),
      surfaceDim: Color(0xffdadada),
      surfaceBright: Color(0xfff9f9f9),
      surfaceContainerLowest: Color(0x8BF9F9F9),
      surfaceContainerLow: Color(0xfff3f3f3),
      surfaceContainer: Color(0xffeeeeee),
      surfaceContainerHigh: Color(0xffe8e8e8),
      surfaceContainerHighest: Color(0xffe2e2e2),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4d0006),
      surfaceTint: Color(0xffc0001f),
      onPrimary: Color(0x8BF9F9F9),
      primaryContainer: Color(0xff8b0013),
      onPrimaryContainer: Color(0x8BF9F9F9),
      secondary: Color(0x00010f0f),
      onSecondary: Color(0x8BF9F9F9),
      secondaryContainer: Color(0xff861119),
      onSecondaryContainer: Color(0x8BF9F9F9),
      tertiary: Color(0xff371b00),
      onTertiary: Color(0x8BF9F9F9),
      tertiaryContainer: Color(0xff663700),
      onTertiaryContainer: Color(0x8BF9F9F9),
      error: Color(0xff4e0002),
      onError: Color(0x8BF9F9F9),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0x8BF9F9F9),
      surface: Color(0xfffdf8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff212525),
      outline: Color(0xff404344),
      outlineVariant: Color(0xff404344),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323030),
      inversePrimary: Color(0xffffe7e4),
      primaryFixed: Color(0xff8b0013),
      onPrimaryFixed: Color(0x8BF9F9F9),
      primaryFixedDim: Color(0xff61000a),
      onPrimaryFixedVariant: Color(0x8BF9F9F9),
      secondaryFixed: Color(0xff861119),
      onSecondaryFixed: Color(0x8BF9F9F9),
      secondaryFixedDim: Color(0xff61000a),
      onSecondaryFixedVariant: Color(0x8BF9F9F9),
      tertiaryFixed: Color(0xff663700),
      onTertiaryFixed: Color(0x8BF9F9F9),
      tertiaryFixedDim: Color(0xff462400),
      onTertiaryFixedVariant: Color(0x8BF9F9F9),
      surfaceDim: Color(0xffded9d8),
      surfaceBright: Color(0xfffdf8f7),
      surfaceContainerLowest: Color(0x8BF9F9F9),
      surfaceContainerLow: Color(0xfff8f2f2),
      surfaceContainer: Color(0xfff2edec),
      surfaceContainerHigh: Color(0xffece7e6),
      surfaceContainerHighest: Color(0xffe6e1e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd90024),
      surfaceTint: Color(0xffd90024),
      onPrimary: Color(0xff68000c),
      primaryContainer: Color(0xffd90024),
      onPrimaryContainer: Color(0x8BF9F9F9),
      secondary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFEAEAEB),
      secondaryContainer: Color(0xff830d16),
      onSecondaryContainer: Color(0xffffc9c5),
      tertiary: Color(0xffffb878),
      onTertiary: Color(0xff4c2700),
      tertiaryContainer: Color(0xffa05900),
      onTertiaryContainer: Color(0x8BF9F9F9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe6e1e1),
      onSurfaceVariant: Color(0xffc4c7c8),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e1e1),
      inversePrimary: Color(0xffc0001f),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff410004),
      primaryFixedDim: Color(0xffffb3ae),
      onPrimaryFixedVariant: Color(0xff930015),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff410004),
      secondaryFixedDim: Color(0xffffb3ae),
      onSecondaryFixedVariant: Color(0xff8c161c),
      tertiaryFixed: Color(0xffffdcc1),
      onTertiaryFixed: Color(0xff2e1500),
      tertiaryFixedDim: Color(0xffffb878),
      onTertiaryFixedVariant: Color(0xff6c3a00),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3938),
      surfaceContainerLowest: Color(0xff0f0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff211f1f),
      surfaceContainerHigh: Color(0xff2b2a29),
      surfaceContainerHighest: Color(0xff363434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb9b3),
      surfaceTint: Color(0xffffb3ad),
      onPrimary: Color(0xff370003),
      primaryContainer: Color(0xffff5450),
      onPrimaryContainer: Color(0x00010f0f),
      secondary: Color(0xffffb9b3),
      onSecondary: Color(0xff370003),
      secondaryContainer: Color(0xffff5450),
      onSecondaryContainer: Color(0x00010f0f),
      tertiary: Color(0xffffb9b3),
      onTertiary: Color(0xff370003),
      tertiaryContainer: Color(0xffff5450),
      onTertiaryContainer: Color(0x00010f0f),
      error: Color(0xffffb9b6),
      onError: Color(0xff370005),
      errorContainer: Color(0xffe36c6c),
      onErrorContainer: Color(0x00010f0f),
      surface: Color(0xff131313),
      onSurface: Color(0x8BF9F9F9),
      onSurfaceVariant: Color(0x00010f0f),
      outline: Color(0xffa0a3a4),
      outlineVariant: Color(0xff808484),
      shadow: Color(0x00010f0f),
      scrim: Color(0x00010f0f),
      inverseSurface: Color(0xffe2e2e2),
      inversePrimary: Color(0xff950012),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff2d0002),
      primaryFixedDim: Color(0xffffb3ad),
      onPrimaryFixedVariant: Color(0xff73000c),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff2d0002),
      secondaryFixedDim: Color(0xffffb3ad),
      onSecondaryFixedVariant: Color(0xff73000c),
      tertiaryFixed: Color(0xffffdad7),
      onTertiaryFixed: Color(0xff2d0002),
      tertiaryFixedDim: Color(0xffffb3ad),
      onTertiaryFixedVariant: Color(0xff73000c),
      surfaceDim: Color(0xff131313),
      surfaceBright: Color(0xff393939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1b1b1b),
      surfaceContainer: Color(0xff1f1f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353535),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb3ad),
      onPrimary: Color(0x00010f0f),
      primaryContainer: Color(0xffffb9b3),
      onPrimaryContainer: Color(0x00010f0f),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0x00010f0f),
      secondaryContainer: Color(0xffffb9b3),
      onSecondaryContainer: Color(0x00010f0f),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0x00010f0f),
      tertiaryContainer: Color(0xffffb9b3),
      onTertiaryContainer: Color(0x00010f0f),
      error: Color(0xfffff9f9),
      onError: Color(0x00010f0f),
      errorContainer: Color(0xffffb9b6),
      onErrorContainer: Color(0x00010f0f),
      surface: Color(0xff131313),
      onSurface: Color(0x8BF9F9F9),
      onSurfaceVariant: Color(0x00010f0f),
      outline: Color(0xffc8cbcc),
      outlineVariant: Color(0xffc8cbcc),
      shadow: Color(0x00010f0f),
      scrim: Color(0x00010f0f),
      inverseSurface: Color(0xffe2e2e2),
      inversePrimary: Color(0xff5c0007),
      primaryFixed: Color(0xffffe0dd),
      onPrimaryFixed: Color(0x00010f0f),
      primaryFixedDim: Color(0xffffb9b3),
      onPrimaryFixedVariant: Color(0xff370003),
      secondaryFixed: Color(0xffffe0dd),
      onSecondaryFixed: Color(0x00010f0f),
      secondaryFixedDim: Color(0xffffb9b3),
      onSecondaryFixedVariant: Color(0xff370003),
      tertiaryFixed: Color(0xffffe0dd),
      onTertiaryFixed: Color(0x00010f0f),
      tertiaryFixedDim: Color(0xffffb9b3),
      onTertiaryFixedVariant: Color(0xff370003),
      surfaceDim: Color(0xff131313),
      surfaceBright: Color(0xff393939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1b1b1b),
      surfaceContainer: Color(0xff1f1f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353535),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        bottomAppBarTheme: BottomAppBarTheme(
          color: colorScheme.primary,
        ),
        appBarTheme: AppBarTheme(
          color: colorScheme.primary,
        ),
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSecondary,
          displayColor: colorScheme.primary,
        ),
        primaryColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        tabBarTheme: TabBarTheme(
          indicatorColor: colorScheme.primaryContainer,
          labelColor: colorScheme.primaryContainer,
          dividerColor: Colors.transparent,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        scrollbarTheme: const ScrollbarThemeData(
          thumbVisibility: WidgetStatePropertyAll(true),
        ),
      );
}
