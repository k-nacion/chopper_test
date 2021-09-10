import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const bombay = Color(0xFFB4B5BF);
const outerSpace = Color(0xFF333738);
const driftWood = Color(0xFFAF8644);
const smoky = Color(0xFF615A71);

ThemeData generateAppTheme(BuildContext context) {
  const $primaryColor = driftWood;
  const $accentColor = bombay;
  const $scaffoldBackground = outerSpace;

  return ThemeData(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: $scaffoldBackground,
    primaryColor: $primaryColor,
    accentColor: $accentColor,
    textTheme: GoogleFonts.montserratTextTheme(),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colours.swatch($primaryColor)),
  );
}
