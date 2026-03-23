/*
Exercise 3:
3. a) Create String phrase = 'Learning Dart'.
b) Print phrase.length, phrase.toLowerCase(), and phrase.contains('Dart').
c) Trim spaces from String test = ' Dart ' and print the result.
*/
void main() {
  String phrase = 'Learning Dart';
  print('Phrase length: ${phrase.length}');
  print('Phrase in lowercase: ${phrase.toLowerCase()}');
  print('Phrase contains "Dart": ${phrase.contains('Dart')}');
  
  String test = ' Dart ';
  print('Trimmed test string: "${test.trim()}"');
}
