import 'dart:math';

import 'package:tic_tac_toe/constants.dart';

final Random rand = new Random();

int getRandomNumber(int max, [int min = 0]) {
  return min + rand.nextInt(max + 1 - min);
}

displayPlayerSymbol(Player p) {
  switch(p){
    case Player.X:
      return 'X';
    case Player.O:
      return 'O';
    default:
      return '';
  }
}