import 'package:flutter/foundation.dart';
import 'dart:collection';

class BoardModel extends ChangeNotifier {
  /// Internal, private state of the board
  final List<List<Square>> _squares = [
    [
      Square(''),Square(''),Square(''),
    ],
    [
      Square(''),Square(''),Square(''),
    ],
    [
      Square(''),Square(''),Square(''),
    ],
  ];

  // BoardModel() {}

  void resetBoard() {

  }

  UnmodifiableListView<List<Square>> get squares => UnmodifiableListView(_squares);

  UnmodifiableListView<Square> getRows(row) => UnmodifiableListView(squares[row]);

  void setSquare(String value, row, column) {
    this._squares[row].replaceRange(column, column + 1, [Square(value)]);
    notifyListeners();
  }
}

@immutable
class Square {
  final String _value;

  Square(this._value);

  String get value => this._value;  
}