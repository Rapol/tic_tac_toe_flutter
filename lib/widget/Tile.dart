import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/constants.dart';

displayTileValue(Player p) {
  switch(p){
    case Player.X:
      return 'X';
    case Player.O:
      return 'O';
    default:
      return '';
  }
}

class Tile extends StatelessWidget {
  final int columnIndex;
  final int rowIndex;
  final Border borderSettings;
  final Square square;

  Tile({this.borderSettings, this.square, this.columnIndex, this.rowIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<BoardModel>(context, listen: false)
          .setSquare(rowIndex, columnIndex),
      child: Column(
        children: <Widget>[
          Container(
              height: 120.0,
              width: 100.0,
              decoration: BoxDecoration(
                border: borderSettings,
              ),
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  displayTileValue(square.value),
                  style: Theme.of(context).textTheme.headline,
                ),
              ))
        ],
      ),
    );
  }
}
