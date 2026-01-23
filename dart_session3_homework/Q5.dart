/*
Question 13
Write a Dart program that calculates a grade (A, B, C, or D) based on a mark. Then use a switch
statement to print a message for each grade.
*/
import 'dart:io';

void main() {
  print('Enter the mark:(0->100) ');
  num? mark = num.tryParse(stdin.readLineSync()!); //tryParse to avoid exception

  if (mark != null && mark <= 100 && mark >= 0) {
    String grade;
    if (mark >= 85)
      grade = 'A';
    else if (mark >= 70)
      grade = 'B';
    else if (mark >= 50)
      grade = 'C';
    else
      grade = 'D';

    switch (grade) {
      case 'A':
        print('Excellent');
        break;
      case 'B':
        print('Very Good');
        break;
      case 'C':
        print('Good');
        break;
      case 'D':
        print('Failed');
        break;
      default:
        print('Invalid grade');
        break;
    }
  } else {
    print('Invalid mark'); //when the mark is out of range or null
  }
}
