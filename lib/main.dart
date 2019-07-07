import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/constants.dart' as constants;

import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/screens/GameScreen.dart';
import 'package:tic_tac_toe/screens/StartingScreen.dart';

void main() => runApp(MyApp());

const double shadowOffset = 2.0;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => BoardModel(),
      child: MaterialApp(
        title: 'Tic Tac Toe',
        theme: ThemeData(
          // primarySwatch: Colors.green,
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: constants.primaryColor,
          accentColor: constants.accentColor,

          // Define the default font family.
          // fontFamily: 'DM Sans',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(
                fontSize: 46.0,
                fontWeight: FontWeight.bold,
                color: constants.textColor),
            title: TextStyle(fontSize: 24.0, color: constants.textColor),
            subhead: TextStyle(fontSize: 20.0, color: constants.textColor),
            body1: TextStyle(fontSize: 14.0, color: constants.textColor),
            display1: TextStyle(
                fontSize: 55.0,
                fontWeight: FontWeight.bold,
                color: constants.textColor),
            display2: TextStyle(
              fontSize: 84.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF303030),
              shadows: [
                Shadow(
                    // bottomLeft
                    offset: Offset(-shadowOffset, -shadowOffset),
                    color: constants.primaryColor),
                Shadow(
                    // bottomRight
                    offset: Offset(shadowOffset, -shadowOffset),
                    color: constants.primaryColor),
                Shadow(
                    // topRight
                    offset: Offset(shadowOffset, shadowOffset),
                    color: constants.primaryColor),
                Shadow(
                    // topLeft
                    offset: Offset(-shadowOffset, shadowOffset),
                    color: constants.primaryColor),
              ],
            ),
            display3: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF303030),
              shadows: [
                Shadow(
                    // bottomLeft
                    offset: Offset(-shadowOffset, -shadowOffset),
                    color: constants.accentColor),
                Shadow(
                    // bottomRight
                    offset: Offset(shadowOffset, -shadowOffset),
                    color: constants.accentColor),
                Shadow(
                    // topRight
                    offset: Offset(shadowOffset, shadowOffset),
                    color: constants.accentColor),
                Shadow(
                    // topLeft
                    offset: Offset(-shadowOffset, shadowOffset),
                    color: constants.accentColor),
              ],
            ),
            display4: TextStyle(fontSize: 20.0, color: constants.accentColor, fontWeight: FontWeight.bold),
          ),
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
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => StartingScreen(),
          '/game': (context) => GameScreen(),
        },
      ),
    );
  }
}
