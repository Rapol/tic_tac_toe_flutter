import 'dart:math';

final Random rand = new Random();

int getRandomNumber(int max, [int min = 0]) {
  return min + rand.nextInt(max + 1 - min);
}
