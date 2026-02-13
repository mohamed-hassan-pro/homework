/*
Q7
Ask the user to input a list of integers.
- Print the largest number, the smallest number, and their difference.
- Calculate the average of the list.
- Print all numbers that are above the average.
- Finally, print how many numbers are even and how many are odd in the list.
*/
import 'dart:io';

void main() {
  List<int> numbers = [];
  int largest = -9223372036854775808;
  int smallest = 9223372036854775807;
  int countOfNumbers = 0;
  int sum = 0;
  int oddCount = 0;
  int evenCount = 0;
  print('Enter List of integer number:');
  for (int i = 0; i < 6; i++) {
    print('Enter a number ${i + 1}:');
    int? num = int.tryParse(stdin.readLineSync() ?? '');
    if (num != null) {
      numbers.add(num);
      countOfNumbers++;
      sum += num;
      if (num > largest) {
        largest = num;
      }
      if (num < smallest) {
        smallest = num;
      }

      if (num % 2 == 0) {
        evenCount++;
      } else {
        oddCount++;
      }
    } else {
      print('Invalid input');
      i--;
    }
  }

  print('Largest number = $largest');
  print('Smallest number = $smallest');
  print(
    'difference between Largest and Smallest number = ${largest - smallest}',
  );

  double avg = sum / countOfNumbers;
  print('Average numbers = $avg');

  for (int num in numbers) {
    if (num > avg) {
      print('number: $num > avg: $avg');
    }
  }

  print('$evenCount Even numbers');
  print('$oddCount Odd numbers');
}
