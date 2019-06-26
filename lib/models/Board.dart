import 'package:flutter/foundation.dart';
import 'dart:collection';

import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/utils/BoardUtils.dart';

class BoardModel extends ChangeNotifier {
  Player _currentPlayer = Player.X;

  static int boardSize = 3;

  final Map<Player, List<int>> _playerMoves = {
    Player.X: [],
    Player.O: [],
  };

  BoardModel({List<int> xPlayerMoves, List<int> oPlayerMoves}) {
    _playerMoves[Player.X] ??= xPlayerMoves;
    _playerMoves[Player.O] ??= oPlayerMoves;
  }

  List<List<Square>> _buildBoard() {
    return List<List<Square>>.generate(
      boardSize,
      (int row) => List<Square>.generate(
            boardSize,
            (int column) {
              if (this
                  ._playerMoves[Player.X]
                  .contains(getTileNumber(row, column))) {
                return Square(Player.X);
              } else if (this
                  ._playerMoves[Player.O]
                  .contains(getTileNumber(row, column))) {
                return Square(Player.O);
              }
              return Square();
            },
          ),
    );
  }

  UnmodifiableListView<List<Square>> get squares =>
      UnmodifiableListView(_buildBoard());

  UnmodifiableListView<Square> getRows(row) =>
      UnmodifiableListView(squares[row]);

  void setSquare(row, column) {
    if (this.squares[row][column].value != null) {
      return;
    }
    _playerMoves[_currentPlayer].add(getTileNumber(row, column));
    print(_playerMoves);
    _nextTurn();
    notifyListeners();
  }

  void _nextTurn() {
    _currentPlayer = _currentPlayer == Player.X ? Player.O : Player.X;
  }

  void clearBoard() {
    _playerMoves[Player.X].clear();
    _playerMoves[Player.O].clear();
  }
}

@immutable
class Square {
  final Player _value;

  Square([this._value]);

  Player get value => this._value;
}
