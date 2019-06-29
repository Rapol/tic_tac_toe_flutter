import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constants.dart' as prefix0;

import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/screens/GameScreen.dart';
import 'package:tic_tac_toe/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => BoardModel(),
      child: MaterialApp(
        title: 'Flutter Tic Tac Tow',
        theme: ThemeData(
          // primarySwatch: Colors.green,
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: primaryColor,
          accentColor: accentColor,

          // Define the default font family.
          fontFamily: 'DM Sans',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 46.0, fontWeight: FontWeight.bold, color: textColor),
            subhead: TextStyle(fontSize: 24.0, color: textColor),
            title: TextStyle(fontSize: 36.0, color: textColor),
            body1: TextStyle(fontSize: 14.0, color: textColor),
            display1: TextStyle(fontSize: 55.0, fontWeight: FontWeight.bold, color: textColor),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(),
            textTheme: ButtonTextTheme.accent,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => GameScreen(),
        },
      ),
    );
  }
}
