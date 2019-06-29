import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/constants.dart';

import 'package:tic_tac_toe/models/Board.dart';

import 'package:tic_tac_toe/widget/Board.dart';
import 'package:tic_tac_toe/widget/ScoreBoard.dart';
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
                Column(
                  children: <Widget>[
                    ScoreBoard(
                        xScore: board.getXScore, oScore: board.getOScore),
                    Container(
                      padding: EdgeInsets.only(top: 60.0),
                      child: Board(),
                    ),
                  ],
                ),
                board.gameState != GameState.IN_PROGRESS
                    ? ResultOverlay()
                    : Container(),
              ],
            ),
      ),
    );
  }
}
