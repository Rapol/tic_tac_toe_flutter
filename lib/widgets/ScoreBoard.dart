import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/models/Board.dart';

class ScoreBoard extends StatelessWidget {
  int xScore = 0;
  int oScore = 0;

  ScoreBoard({this.xScore, this.oScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('X', style: Theme.of(context).textTheme.title, textAlign: TextAlign.center,),
              Text('Score $xScore', style: Theme.of(context).textTheme.subhead,),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('O', style: Theme.of(context).textTheme.title,),
              Text('Score $oScore', style: Theme.of(context).textTheme.subhead,),
            ],
          ),
        ],
      ),
    );
  }
}
