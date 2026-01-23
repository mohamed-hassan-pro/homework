/*
Question 20
Write a Dart program that checks access rules for a ticket gate. If the user is under 18, check if they
have a parent. Use a switch statement on an area variable (general or restricted) to decide what
message to print.
*/
import 'dart:io';

void main() {
  print('Enter your age: ');
  int? age = int.tryParse(stdin.readLineSync()!);
  String area = 'restricted';

  if (age! < 18) {
    print('Does the user have a parent? (true/false): ');
    bool? hasParent = bool.tryParse(stdin.readLineSync()!);
    if (hasParent ?? false) {
      switch (area) {
        case 'general':
          print('Access granted to general area with parent supervision');
          break;
        case 'restricted':
          print('Access granted to restricted area with parent supervision');
          break;
        default:
          print('Area not recognized');
      }
    } else {
      print('Access denied: Under 18 without parent supervision');
    }
  } else {
    switch (area) {
      case 'general':
        print('Access granted to general area');
        break;
      case 'restricted':
        print('Access granted to restricted area');
        break;
      default:
        print('Area not recognized');
    }
  }
}
