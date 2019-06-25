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

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<List<Square>> get squares => UnmodifiableListView(_squares);

  void setSquare(String value, row, column) {
    this._squares[row].replaceRange(column, column + 1, [Square(value)]);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}

@immutable
class Square {
  final String _value;

  Square(this._value);

  String get value => this._value;  
}