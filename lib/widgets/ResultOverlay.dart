import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/constants.dart' as constants;

import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/widgets/LandingLayout.dart';

class ResultOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Consumer<BoardModel>(builder: (context, board, child) {
      final List<Widget> content =
          board.gameState == constants.GameState.FINISHED
              ? <Widget>[
                  Text(
                    '${board.currentPlayer}',
                    style: textStyle,
                  ),
                  Text(
                    'Won',
                    style: textStyle,
                  ),
                ]
              : <Widget>[
                  Text(
                    'Tied Game!',
                    style: textStyle,
                  ),
                ];
      return LandingLayout(
        backgroundColor: Colors.black54,
        titlePadding: EdgeInsets.fromLTRB(50.0, 0, 0, 80.0),
        content: content,
        actionPadding: EdgeInsets.all(10.0),
        actions: <Widget>[
          Expanded(
            child: OutlineButton(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Retry',
                style: Theme.of(context).textTheme.display4,
              ),
              onPressed: board.resetGame,
              borderSide: BorderSide(width: 1.5, color: constants.primaryColor),
            ),
          ),
        ],
      );
    });
  }
}
