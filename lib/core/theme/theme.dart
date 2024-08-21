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
      shadow: Color.fromARGB(255, 197, 196, 196),
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

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFA0CAFD),
      surfaceTint: Color(0xFFA0CAFD),
      onPrimary: Color(0xFF001D36),
      primaryContainer: Color(0xFF36618E),
      onPrimaryContainer: Color(0xFFD1E4FF),
      secondary: Color(0xFFB0BCCB),
      onSecondary: Color(0xFF101C2B),
      secondaryContainer: Color(0xFF3B4859),
      onSecondaryContainer: Color(0xFFD7E3F7),
      tertiary: Color(0xFFD3C0E6),
      onTertiary: Color(0xFF251431),
      tertiaryContainer: Color(0xFF4A4157),
      onTertiaryContainer: Color(0xFFF2DAFF),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF121212),
      onBackground: Color(0xFFE0E0E0),
      surface: Color(0xFF121212),
      onSurface: Color(0xFFE0E0E0),
      surfaceVariant: Color(0xFF43474E),
      onSurfaceVariant: Color(0xFFC3C7CF),
      outline: Color(0xFF8C9196),
      outlineVariant: Color(0xFF73777F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE0E0E0),
      inverseOnSurface: Color(0xFF2E3135),
      inversePrimary: Color(0xFF36618E),
      primaryFixed: Color(0xFF36618E),
      onPrimaryFixed: Color(0xFFD1E4FF),
      primaryFixedDim: Color(0xFF001D36),
      onPrimaryFixedVariant: Color(0xFFD1E4FF),
      secondaryFixed: Color(0xFF3B4859),
      onSecondaryFixed: Color(0xFFD7E3F7),
      secondaryFixedDim: Color(0xFF101C2B),
      onSecondaryFixedVariant: Color(0xFFD7E3F7),
      tertiaryFixed: Color(0xFF4A4157),
      onTertiaryFixed: Color(0xFFF2DAFF),
      tertiaryFixedDim: Color(0xFF251431),
      onTertiaryFixedVariant: Color(0xFFF2DAFF),
      surfaceDim: Color(0xFF1C1C1E),
      surfaceBright: Color(0xFF2C2C2E),
      surfaceContainerLowest: Color(0xFF0A0A0A),
      surfaceContainerLow: Color.fromARGB(255, 83, 81, 81),
      surfaceContainer: Color(0xFF1C1C1E),
      surfaceContainerHigh: Color(0xFF2C2C2E),
      surfaceContainerHighest: Color(0xFF3C3C3E),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      fontFamily: "Montserrat",
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
      filledButtonTheme: const FilledButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll<Size>(Size.fromHeight(44)),
        ),
      ));

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
