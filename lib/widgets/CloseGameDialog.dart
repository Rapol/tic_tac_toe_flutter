import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/models/Board.dart';

class CloseGameDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exit Game'),
      content: Text('Do you want to exit the game?'),
      actions: <Widget>[
        FlatButton(
          child: Text('No'),
          onPressed: () => Navigator.pop(context, false),
        ),
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Provider.of<BoardModel>(context, listen: false).endGame();
            return Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}
