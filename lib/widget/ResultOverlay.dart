import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constants.dart';

import 'package:tic_tac_toe/models/Board.dart';

class ResultOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Consumer<BoardModel>(
        builder: (context, board, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                board.gameState == GameState.FINISHED ?
                  Text('${board.currentPlayer} Won!') : Text('Tied Game!')
                ,
                RaisedButton(
                  child: Text('Retry'),
                  
                  onPressed: board.resetGame,
                )
              ],
            ),
      ),
    );
  }
}
