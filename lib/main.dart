import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/screens/GameScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => BoardModel(),
      child: MaterialApp(
        title: 'Flutter Tic Tac Tow',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.orange,
          accentColor: Colors.purpleAccent,

          // Define the default font family.
          fontFamily: 'DM Sans',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
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
