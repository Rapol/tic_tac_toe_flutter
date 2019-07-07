import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/screens/GameScreen.dart';
import 'package:tic_tac_toe/screens/StartScreen.dart';
import 'package:tic_tac_toe/utils/Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => BoardModel(),
      child: MaterialApp(
        title: 'Tic Tac Toe',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => StartScreen(),
          '/game': (context) => GameScreen(),
        },
      ),
    );
  }
}
