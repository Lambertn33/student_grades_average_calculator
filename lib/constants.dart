import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.deepOrange;
  static String mainAppTitle = 'Students average calculator app';
  static final mainBarFont = GoogleFonts.poppins(
    fontSize: 20, color: mainColor
  );
  static TextStyle averageStyles = const TextStyle(
    fontSize: 32
  );
}