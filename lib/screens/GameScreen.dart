import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/constants.dart';

import 'package:tic_tac_toe/models/Board.dart';

import 'package:tic_tac_toe/widget/Board.dart';
import 'package:tic_tac_toe/widget/ResultOverlay.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Consumer<BoardModel>(
        builder: (context, board, child) => Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Board(),
                board.gameState != GameState.IN_PROGRESS
                    ? ResultOverlay()
                    : Container(),
              ],
            ),
      ),
    );
  }
}
