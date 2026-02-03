/*
Q8. Digits Operations - Ask the user for a number (e.g., 528). - Print the sum of its digits and also
print the largest digit.
*/
import 'dart:io';

void main() {
  print('Enter a number (e.g., 528):');
  int number = int.parse(stdin.readLineSync()!);

  int sum = 0;
  int maxDigit = 0;
  int tempNumber = number;

  while (tempNumber > 0) {
    int digit = tempNumber % 10;
    sum = sum + digit;
    if (digit > maxDigit) {
      maxDigit = digit;
    }
    tempNumber = tempNumber ~/ 10;
  }

  print('Sum of digits: $sum');
  print('Largest digit: $maxDigit');
}
