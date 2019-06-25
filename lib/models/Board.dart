import 'package:flutter/foundation.dart';
import 'dart:collection';

enum Player {
  X,
  O,
}

int getTileNumber(int row, int column) => row * 3 + column;

class BoardModel extends ChangeNotifier {
  Player _currentPlayer = Player.X;

  final Map<Player, List<int>> _playerMoves = {
    Player.X: [],
    Player.O: [],
  };

  // BoardModel() {}

  List<List<Square>> _buildBoard() {
    return List<List<Square>>.generate(
      3,
      (int row) => List<Square>.generate(
            3,
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

  void resetBoard() {}
}

@immutable
class Square {
  final Player _value;

  Square([this._value]);

  Player get value => this._value;
}
