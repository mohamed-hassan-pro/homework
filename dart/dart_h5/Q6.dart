/*
Q6. Number Guessing (3 Tries) - Generate a random number between 1 and 20. - Let the user
guess up to 3 times. If they fail, reveal the correct number.
*/
import 'dart:io';

void main() {
  int correctNumber = 7;

  print('Guess the number (1-20). You have 3 tries.');

  bool isWinner = false;

  for (int i = 1; i <= 3; i++) {
    print('Attempt $i/3 - Enter your guess:');
    int guess = int.parse(stdin.readLineSync()!);

    if (guess == correctNumber) {
      print('Correct! You won.');
      isWinner = true;
      break;
    } else {
      print('Wrong guess.');
    }
  }

  if (isWinner == false) {
    print('Game Over! The correct number was $correctNumber');
  }
}
