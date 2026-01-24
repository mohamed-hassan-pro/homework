/*
Question 11
Write a Dart program that applies discounts to a price. Use nested if/else to apply different
discounts based on whether the user is a student, has a coupon, or if the price is above a threshold.
Print the final price.
*/
import 'dart:io';

void main() {
  print('Is he a student? (Y/N): ');
  String? isStudent = stdin.readLineSync();

  print('He has a discount coupon? (Y/N): ');
  String? hasCoupon = stdin.readLineSync();

  print('Enter the price: ');
  num? price = num.tryParse(stdin.readLineSync()!);

  double finalPrice = 0;

  if (isStudent!.toUpperCase() == 'Y' ||
      hasCoupon!.toUpperCase() == 'Y' ||
      (price ?? 0) > 200) {
    finalPrice += 0.8;
    print('total price = ${((price ?? 0) * finalPrice).toStringAsFixed(2)}');
  } else {
    print('no discount applied, total price = ${price ?? 0}');
  }
}
