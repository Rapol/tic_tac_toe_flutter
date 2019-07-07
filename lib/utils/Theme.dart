import 'package:flutter/material.dart';

import 'package:tic_tac_toe/constants.dart' as constants;

List<Shadow> _generateOutlineShadow(
    {Color outlineColor, double outlineBorderSize = 2.0}) {
  return [
    Shadow(
        // bottomLeft
        offset: Offset(-outlineBorderSize, -outlineBorderSize),
        color: outlineColor),
    Shadow(
        // bottomRight
        offset: Offset(outlineBorderSize, -outlineBorderSize),
        color: outlineColor),
    Shadow(
        // topRight
        offset: Offset(outlineBorderSize, outlineBorderSize),
        color: outlineColor),
    Shadow(
        // topLeft
        offset: Offset(-outlineBorderSize, outlineBorderSize),
        color: outlineColor),
  ];
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
        fontSize: 46.0,
        fontWeight: FontWeight.bold,
        color: constants.textColor),
    title: base.headline.copyWith(
      fontSize: 24.0,
      color: constants.textColor,
    ),
    subhead: base.headline.copyWith(
      fontSize: 20.0,
      color: constants.textColor,
    ),
    body1: base.body1.copyWith(
      fontSize: 14.0,
      color: constants.textColor,
    ),
    display1: base.display1.copyWith(
        fontSize: 55.0,
        fontWeight: FontWeight.bold,
        color: constants.textColor),
    display2: base.display2.copyWith(
      fontSize: 84.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF303030),
      shadows: _generateOutlineShadow(outlineColor: constants.primaryColor),
    ),
    display3: base.display3.copyWith(
      fontSize: 42.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF303030),
      shadows: _generateOutlineShadow(outlineColor: constants.accentColor),
    ),
    display4: base.display4.copyWith(
        fontSize: 20.0,
        color: constants.accentColor,
        fontWeight: FontWeight.bold),
  );
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    // primarySwatch: Colors.green,
    primaryColor: constants.primaryColor,
    accentColor: constants.accentColor,

    textTheme: _buildTextTheme(base.textTheme),
    buttonTheme: ButtonThemeData(
      buttonColor: constants.primaryColor,
      shape: RoundedRectangleBorder(),
      highlightColor: Color(0x00),
      splashColor: constants.primaryColor,
      textTheme: ButtonTextTheme.accent,
    ),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
  );
}

final ThemeData appTheme = _buildTheme();
