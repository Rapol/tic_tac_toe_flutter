import 'package:flutter/material.dart';

import 'package:tic_tac_toe/widget/Tile.dart';

const BorderSide defaultBorder  = BorderSide(width: 5.0);
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
  final int _rowIndex;
  
  TileRow(this._rowIndex);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (tileIndex) => Tile(tileBorders[tileIndex + _rowIndex * 3])),
    );
  }
}