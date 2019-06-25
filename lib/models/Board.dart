import 'package:flutter/foundation.dart';
import 'dart:collection';

enum Player {
  X,
  O,
}

class BoardModel extends ChangeNotifier {
  /// Internal, private state of the board
  final List<List<Square>> _squares = [
    [
      Square(),Square(),Square(),
    ],
    [
      Square(),Square(),Square(),
    ],
    [
      Square(),Square(),Square(),
    ],
  ];

  Player _currentPlayer = Player.X;

  // BoardModel() {}

  UnmodifiableListView<List<Square>> get squares => UnmodifiableListView(_squares);

  UnmodifiableListView<Square> getRows(row) => UnmodifiableListView(squares[row]);

  void setSquare(row, column) {
    if(this._squares[row][column].value != null){
      return;
    }
    this._squares[row].replaceRange(column, column + 1, [Square(_currentPlayer)]);
    _nextTurn();
    notifyListeners();
  }

  void _nextTurn(){
    _currentPlayer = _currentPlayer == Player.X ? Player.O : Player.X;
  }

  void resetBoard() {

  }
}

@immutable
class Square {
  final Player _value;

  Square([this._value]);

  Player get value => this._value;  
}