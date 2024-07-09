import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'core/constants.dart';

const BoxDecoration customDecoration = BoxDecoration(
    color: AppColors.glassColor,
    border: GradientBoxBorder(
      gradient: LinearGradient(
        colors: AppColors.gradientBorderGlare,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ));

final ThemeData gameThemeDark = ThemeData(
  // Define your primary and accent colors here
  textTheme: const TextTheme(
    //body
    bodyLarge: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontSize: 24,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontSize: 14,
    ),
    //headings
    headlineLarge: TextStyle(
      color: Colors.white,
      fontFamily: 'Apex',
      fontSize: 32,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontFamily: 'Apex',
      fontSize: 24,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontFamily: 'Apex',
      fontSize: 16,
    ),
    labelSmall: TextStyle(
        color: AppColors.greyText,
        fontFamily: 'Montserrat',
        fontSize: 12,
        fontWeight: FontWeight.w300),
    labelLarge: TextStyle(
        color: AppColors.greyText,
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.w700),
    // You may want to define other text styles as well
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.red),
);
