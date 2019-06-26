import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:tic_tac_toe/widget/Tile.dart';
import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/utils/BoardUtils.dart';

const BorderSide defaultBorder = BorderSide(width: 5.0);

// TODO: make this list dynamic
const tileBorders = [
  Border(
    right: defaultBorder,
    bottom: defaultBorder,
  ),
  Border(
    right: defaultBorder,
    bottom: defaultBorder,
  ),
  Border(
    bottom: defaultBorder,
  ),
  Border(
    right: defaultBorder,
    bottom: defaultBorder,
  ),
  Border(
    right: defaultBorder,
    bottom: defaultBorder,
  ),
  Border(
    bottom: defaultBorder,
  ),
  Border(
    right: defaultBorder,
  ),
  Border(
    right: defaultBorder,
  ),
  Border(),
];

class TileRow extends StatelessWidget {
  final int rowIndex;
  final UnmodifiableListView<Square> squares;

  TileRow({this.rowIndex, this.squares});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        BoardModel.boardSize,
        (columnIndex) => Tile(
              borderSettings: tileBorders[getTileNumber(rowIndex, columnIndex)],
              square: squares[columnIndex],
              rowIndex: rowIndex,
              columnIndex: columnIndex,
            ),
      ),
    );
  }
}
