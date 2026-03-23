/*
Q6
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
An input string is valid if:
1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
3. Every close bracket has a corresponding open bracket of the same type.
Examples:
- '()' → Valid
- '()[]{}' → Valid
- '(]' → Invalid
- '([)]' → Invalid
- '{[]}' → Valid
*/
import 'dart:io';

void main() {
  // String s = '[(])';
  String s = stdin.readLineSync()!;

  if (isValid(s)) {
    print('Valid');
  } else {
    print('InValid');
  }
}

bool isValid(String s) {
  while (s.contains('()') || s.contains('[]') || s.contains('{}')) {
    s = s.replaceAll('()', '').replaceAll('[]', '').replaceAll('{}', '');
  }
  return s.isEmpty;
}
