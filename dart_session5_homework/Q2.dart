/*
Q2. Odd Numbers in a Range - Ask the user to input a number n. - Print all odd numbers between 1
and n, and also print how many odd numbers were found.
*/
import 'dart:io';

void main() {
  int? n;
  int oddCount = 0;
  do {
    print('Enter a number n:');
    n = int.tryParse(stdin.readLineSync()!);
    if (n != null && n > 0) {
      for (int i = 1; i < n; i++) {
        if (i % 2 != 0) {
          print(i);
          oddCount++;
        }
      }
    } else {
      print('Please enter a valid number greater than 0');
    }
  } while (n == null || n < 1);

  print('Total odd numbers found: $oddCount');
}
