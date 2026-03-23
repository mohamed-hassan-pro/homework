/*
Question 14
Write a Dart program that works with a nullable list of integers. If the list is null or empty, print 'No
scores'. Otherwise, calculate and print the sum of the first and last elements and check if it is
greater than or equal to 40.
*/
import 'dart:io';

void main() {
  List<int> scores = [];

  print('Enter scores separated by spaces (or leave empty for no scores): ');
  String? input = stdin.readLineSync();
  if (input != null && input.isNotEmpty) {
    scores = input.split(' ').map(int.parse).toList();
  }
  // .split(' ') to split the string into (a list of substrings)
  // .map(int.parse) to convert each substring to (an integer)
  // .toList() to convert the iterable to a list

  if (scores.isEmpty) {
    print('No scores');
  } else {
    int sum = scores.first + scores.last;
    print('Sum of first and last elements: $sum');
    print('Is the sum greater than or equal to 40? ${sum >= 40}');
  }
}
