import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

const _brandBlue = Color(0xFF0B63FF);
const _surfaceLight = Color(0xFFF6F8FB);
const _surfaceDark = Color(0xFF0B1221);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _brandBlue,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: _surfaceLight,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _brandBlue,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: _surfaceDark,
);