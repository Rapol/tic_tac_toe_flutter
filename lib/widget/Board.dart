import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/widget/TileRow.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<BoardModel>(
        builder: (context, board, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => TileRow(
                      rowIndex: index,
                      squares: board.getRows(index),
                    ),
              ),
            ),
      ),
    );
  }
}
