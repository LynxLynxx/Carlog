import "package:flutter/material.dart";

class MaterialTheme {
  const MaterialTheme();

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xFF36618E),
      surfaceTint: Color(0xFF36618E),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFD1E4FF),
      onPrimaryContainer: Color(0xFF001D36),
      secondary: Color(0xFF535F70),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFD7E3F7),
      onSecondaryContainer: Color(0xFF101C2B),
      tertiary: Color(0xFF6B5778),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFF2DAFF),
      onTertiaryContainer: Color(0xFF251431),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFF8F9FF),
      onBackground: Color(0xFF191C20),
      surface: Color(0xFFF8F9FF),
      onSurface: Color(0xFF191C20),
      surfaceVariant: Color(0xFF43474E),
      onSurfaceVariant: Color(0xFF43474E),
      outline: Color(0xFF73777F),
      outlineVariant: Color(0xFFC3C7CF),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2E3135),
      inverseOnSurface: Color(0xFFEFF0F7),
      inversePrimary: Color(0xFFA0CAFD),
      primaryFixed: Color(0xFFD1E4FF),
      onPrimaryFixed: Color(0xFF001D36),
      primaryFixedDim: Color(0xFF36618E),
      onPrimaryFixedVariant: Color(0xFF001D36),
      secondaryFixed: Color(0xFFD7E3F7),
      onSecondaryFixed: Color(0xFF101C2B),
      secondaryFixedDim: Color(0xFF535F70),
      onSecondaryFixedVariant: Color(0xFF101C2B),
      tertiaryFixed: Color(0xFFF2DAFF),
      onTertiaryFixed: Color(0xFF251431),
      tertiaryFixedDim: Color(0xFF6B5778),
      onTertiaryFixedVariant: Color(0xFF251431),
      surfaceDim: Color(0xFFF8F9FF),
      surfaceBright: Color(0xFFF8F9FF),
      surfaceContainerLowest: Color(0xFFF8F9FF),
      surfaceContainerLow: Color(0xFFF8F9FF),
      surfaceContainer: Color(0xFFF8F9FF),
      surfaceContainerHigh: Color(0xFFF8F9FF),
      surfaceContainerHighest: Color(0xFFE1E2E8),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff553f0f),
      surfaceTint: Color(0xff735b28),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8b713c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4d412b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff81735a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3c471d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6d7a4b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f2),
      onBackground: Color(0xff1e1b17),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff1e1b17),
      surfaceVariant: Color(0xffede1d1),
      onSurfaceVariant: Color(0xff494236),
      outline: Color(0xff665e51),
      outlineVariant: Color(0xff82796c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff33302b),
      inverseOnSurface: Color(0xfff7efe8),
      inversePrimary: Color(0xffe3c286),
      primaryFixed: Color(0xff8b713c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff715826),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff81735a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff675a43),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6d7a4b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff556134),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe0d9d2),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf2eb),
      surfaceContainer: Color(0xfff4ede5),
      surfaceContainerHigh: Color(0xffeee7e0),
      surfaceContainerHighest: Color(0xffe9e1da),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff2f2000),
      surfaceTint: Color(0xff735b28),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff553f0f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2a210e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4d412b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1c2602),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3c471d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f2),
      onBackground: Color(0xff1e1b17),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffede1d1),
      onSurfaceVariant: Color(0xff292319),
      outline: Color(0xff494236),
      outlineVariant: Color(0xff494236),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff33302b),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe9c6),
      primaryFixed: Color(0xff553f0f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3c2a00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4d412b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff362b17),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3c471d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff263009),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe0d9d2),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf2eb),
      surfaceContainer: Color(0xfff4ede5),
      surfaceContainerHigh: Color(0xffeee7e0),
      surfaceContainerHighest: Color(0xffe9e1da),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffe1ab),
      surfaceTint: Color(0xffe3c286),
      onPrimary: Color(0xff402d00),
      primaryContainer: Color(0xffd6b77b),
      onPrimaryContainer: Color(0xff3d2b00),
      secondary: Color(0xffd6c4a7),
      onSecondary: Color(0xff3a2f1a),
      secondaryContainer: Color(0xff4a3e28),
      onSecondaryContainer: Color(0xffe4d2b5),
      tertiary: Color(0xffdceab1),
      onTertiary: Color(0xff2a340c),
      tertiaryContainer: Color(0xffb2c08a),
      onTertiaryContainer: Color(0xff263109),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff16130f),
      onBackground: Color(0xffe9e1da),
      surface: Color(0xff16130f),
      onSurface: Color(0xffe9e1da),
      surfaceVariant: Color(0xff4d463a),
      onSurfaceVariant: Color(0xffd0c5b5),
      outline: Color(0xff998f81),
      outlineVariant: Color(0xff4d463a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e1da),
      inverseOnSurface: Color(0xff33302b),
      inversePrimary: Color(0xff735b28),
      primaryFixed: Color(0xffffdea3),
      onPrimaryFixed: Color(0xff261900),
      primaryFixedDim: Color(0xffe3c286),
      onPrimaryFixedVariant: Color(0xff594313),
      secondaryFixed: Color(0xfff3e0c2),
      onSecondaryFixed: Color(0xff231a08),
      secondaryFixedDim: Color(0xffd6c4a7),
      onSecondaryFixedVariant: Color(0xff51452f),
      tertiaryFixed: Color(0xffdae9b0),
      onTertiaryFixed: Color(0xff161f00),
      tertiaryFixedDim: Color(0xffbfcd96),
      onTertiaryFixedVariant: Color(0xff404b21),
      surfaceDim: Color(0xff16130f),
      surfaceBright: Color(0xff3c3934),
      surfaceContainerLowest: Color(0xff100e0a),
      surfaceContainerLow: Color(0xff1e1b17),
      surfaceContainer: Color(0xff221f1b),
      surfaceContainerHigh: Color(0xff2d2925),
      surfaceContainerHighest: Color(0xff38342f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffe1ab),
      surfaceTint: Color(0xffe3c286),
      onPrimary: Color(0xff3a2800),
      primaryContainer: Color(0xffd6b77b),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffdac8ab),
      onSecondary: Color(0xff1e1504),
      secondaryContainer: Color(0xff9e8f74),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffdceab1),
      onTertiary: Color(0xff242f07),
      tertiaryContainer: Color(0xffb2c08a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff16130f),
      onBackground: Color(0xffe9e1da),
      surface: Color(0xff16130f),
      onSurface: Color(0xfffffaf7),
      surfaceVariant: Color(0xff4d463a),
      onSurfaceVariant: Color(0xffd4c9ba),
      outline: Color(0xffaca193),
      outlineVariant: Color(0xff8b8274),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e1da),
      inverseOnSurface: Color(0xff2d2a25),
      inversePrimary: Color(0xff5b4414),
      primaryFixed: Color(0xffffdea3),
      onPrimaryFixed: Color(0xff190f00),
      primaryFixedDim: Color(0xffe3c286),
      onPrimaryFixedVariant: Color(0xff473303),
      secondaryFixed: Color(0xfff3e0c2),
      onSecondaryFixed: Color(0xff181002),
      secondaryFixedDim: Color(0xffd6c4a7),
      onSecondaryFixedVariant: Color(0xff403520),
      tertiaryFixed: Color(0xffdae9b0),
      onTertiaryFixed: Color(0xff0d1300),
      tertiaryFixedDim: Color(0xffbfcd96),
      onTertiaryFixedVariant: Color(0xff2f3a12),
      surfaceDim: Color(0xff16130f),
      surfaceBright: Color(0xff3c3934),
      surfaceContainerLowest: Color(0xff100e0a),
      surfaceContainerLow: Color(0xff1e1b17),
      surfaceContainer: Color(0xff221f1b),
      surfaceContainerHigh: Color(0xff2d2925),
      surfaceContainerHighest: Color(0xff38342f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf7),
      surfaceTint: Color(0xffe3c286),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe7c68a),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffdac8ab),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff6ffd7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc3d19a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff16130f),
      onBackground: Color(0xffe9e1da),
      surface: Color(0xff16130f),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff4d463a),
      onSurfaceVariant: Color(0xfffffaf7),
      outline: Color(0xffd4c9ba),
      outlineVariant: Color(0xffd4c9ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e1da),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff382700),
      primaryFixed: Color(0xffffe3b3),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe7c68a),
      onPrimaryFixedVariant: Color(0xff201400),
      secondaryFixed: Color(0xfff7e4c6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffdac8ab),
      onSecondaryFixedVariant: Color(0xff1e1504),
      tertiaryFixed: Color(0xffdfedb4),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc3d19a),
      onTertiaryFixedVariant: Color(0xff111900),
      surfaceDim: Color(0xff16130f),
      surfaceBright: Color(0xff3c3934),
      surfaceContainerLowest: Color(0xff100e0a),
      surfaceContainerLow: Color(0xff1e1b17),
      surfaceContainer: Color(0xff221f1b),
      surfaceContainerHigh: Color(0xff2d2925),
      surfaceContainerHighest: Color(0xff38342f),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 96.0, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          displayMedium: TextStyle(
              fontSize: 60.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w400),
          headlineMedium: TextStyle(
              fontSize: 34.0, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
          titleLarge: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          titleMedium: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          titleSmall: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyLarge: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyMedium: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          bodySmall: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          labelLarge: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          labelSmall: TextStyle(
              fontSize: 10.0, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceContainerHighest,
      surfaceContainerHigh: surfaceContainerHigh,
      surfaceContainerLow: surfaceContainerLow,
      surfaceContainerLowest: surfaceContainerLowest,
      surfaceBright: surfaceBright,
      surfaceContainer: surfaceContainer,
      surfaceDim: surfaceDim,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
