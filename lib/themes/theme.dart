import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData().copyWith(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.background,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed().copyWith(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed().copyWith(
      fontWeight: FontWeight.bold,
    ),
  ),
);
final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 99, 8, 246),
    background: const Color.fromARGB(255, 57, 47, 68),
    brightness: Brightness.dark);
