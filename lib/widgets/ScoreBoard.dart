import 'package:flutter/material.dart';

import 'package:tic_tac_toe/constants.dart';

class ScoreBoard extends StatelessWidget {
  final int xScore;
  final int oScore;

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
              Text(X_SYMBOL, style: Theme.of(context).textTheme.title, textAlign: TextAlign.center,),
              Text('Score $xScore', style: Theme.of(context).textTheme.subhead,),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(O_SYMBOL, style: Theme.of(context).textTheme.title,),
              Text('Score $oScore', style: Theme.of(context).textTheme.subhead,),
            ],
          ),
        ],
      ),
    );
  }
}
