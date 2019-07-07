import 'package:flutter/material.dart';

enum Player {
  X,
  O,
}
const String X_SYMBOL = 'X';
const String O_SYMBOL = 'O';
enum GameState {
  IN_PROGRESS,
  FINISHED,
  TIED,
}

const Color primaryColor  = Color(0xff1eb980);
const Color accentColor  = Color(0xFFff8859);
const Color textColor  = Color(0xFFFFFFFF);