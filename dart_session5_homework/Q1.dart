/*
Q1. Sum, Average & Compare - Ask the user for three numbers. - Print their sum and average.
Then, check if the average is greater than 50 or not
*/
import 'dart:io';

void main() {
  print('Enter three numbers:');
  num? no1 = num.tryParse(stdin.readLineSync()!);
  num? no2 = num.tryParse(stdin.readLineSync()!);
  num? no3 = num.tryParse(stdin.readLineSync()!);

  num sum = (no1 ?? 0) + (no2 ?? 0) + (no3 ?? 0);
  print('The sum is: $sum');
  
  num avg = sum / 3;
  print('The average is: $avg');

  bool avgGraterThan50 = avg > 50;
  print('Is average greater than 50? $avgGraterThan50');
}
