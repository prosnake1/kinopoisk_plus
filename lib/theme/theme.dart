import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.blue.shade200),
    useMaterial3: true,
    textTheme: const TextTheme(
        labelMedium: TextStyle(
          fontSize: 20,
          fontFamily: 'MontserratBold',
        ),
        titleLarge: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        )),
    appBarTheme:
        const AppBarTheme(centerTitle: true, scrolledUnderElevation: 0.0));
