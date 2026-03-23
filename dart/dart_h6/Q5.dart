/*
Q5. Find Second Largest Number - Ask the user to enter 6 numbers in a list. - Print the largest number and the second largest number (without sorting the list).
*/
import 'dart:io';

void main() {
  List<int> numbers = [];
  for (int i = 0; i < 6; i++) {
    print('Enter a number ${i + 1}:');
    int? number = int.tryParse(stdin.readLineSync() ?? '');
    if (number != null) {
      numbers.add(number);
    } else {
      print('Invalid input');
      i--;
    }
  }
  findLargestAndsecondLargestNumbers(numbers);
  // int secondLargestNumber = numbers[0];
  // for (int i = 0; i < numbers.length; i++) {
  //   for (int j = 0; j < numbers.length - 1; j++) {
  //     if (numbers[j] > numbers[j + 1]) {
  //       int temp = numbers[j];
  //       numbers[j] = numbers[j + 1];
  //       numbers[j + 1] = temp;
  //     }
  //     if (i == 2) {
  //       secondLargestNumber = numbers[j];
  //     }
  //   }
  // }

  // print('Largest Numbers of List: ${numbers.last}');
  // print('Second Largest Numbers of List: $secondLargestNumber');
}

void findLargestAndsecondLargestNumbers(List<int> numbers) {
  int largest = numbers[0];
  int secondLargest = numbers[0];
  for (int number in numbers) {
    if (number > largest) {
      largest = number;
    }
    if (number < largest && number > secondLargest) {
      secondLargest = number;
    }
  }
  print('Largest Numbers of List: $largest');
  print('Second Largest Numbers of List: $secondLargest');
}
