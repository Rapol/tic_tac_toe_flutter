import 'package:flutter/foundation.dart';
import 'dart:collection';

import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/utils/BoardUtils.dart';

final List<List<int>> winningMoves = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

bool isWinnerMove(List<int> moves) {
  // ...there is no List.some ...
  for (var i = 0; i < winningMoves.length; i++) {
    final bool isWinner =
        winningMoves[i].every((int move) => moves.contains(move));
    if (isWinner) {
      return isWinner;
    }
  }
  return false;
}

class BoardModel extends ChangeNotifier {
  static int boardSize = 3;

  Player _currentPlayer = Player.X;
  GameState _gameState = GameState.IN_PROGRESS;
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
              if (getPlayerMoves(Player.X)
                  .contains(getTileNumber(row, column))) {
                return Square(Player.X);
              } else if (getPlayerMoves(Player.O)
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

  Player get currentPlayer => _currentPlayer;
  GameState get gameState => _gameState;

  void setSquare(row, column) {
    if (this.squares[row][column].value != null) {
      return;
    }
    _playerMoves[_currentPlayer].add(getTileNumber(row, column));
    _updateGameState();
  }

  void _updateGameState() {
    final bool winner = _checkWinner();
    print(_playerMoves);
    if (winner) {
      print('Winner found $winner!');
      _gameState = GameState.FINISHED;
      notifyListeners();
      return;
    }
    final tied = _checkTie();
    if (tied) {
      print('Tied game!');
      _gameState = GameState.TIED;
      notifyListeners();
      return;
    }
    _nextTurn();
    notifyListeners();
  }

  List<int> getPlayerMoves(Player who) {
    return _playerMoves[who];
  }

  bool _checkWinner() {
    return isWinnerMove(getPlayerMoves(_currentPlayer));
  }

  bool _checkTie() {
    return getPlayerMoves(Player.X).length + getPlayerMoves(Player.O).length ==
        boardSize * boardSize;
  }

  void _nextTurn() {
    _currentPlayer = _currentPlayer == Player.X ? Player.O : Player.X;
  }

  void resetGame() {
    _playerMoves[Player.X].clear();
    _playerMoves[Player.O].clear();
    _gameState = GameState.IN_PROGRESS;
    notifyListeners();
  }
}

@immutable
class Square {
  final Player _value;

  Square([this._value]);

  Player get value => this._value;
}
