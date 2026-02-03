/*
Q7. Sentence Word Counter - Ask the user for a short sentence. - Print how many words it contains
and how many characters (excluding spaces).
*/
import 'dart:io';

void main() {
  print('Enter a sentence:');
  String sentence = stdin.readLineSync()!;

  int wordCount = 0;
  int charCount = 0;

  if (sentence.isNotEmpty) {
    wordCount = 1; 

    for (int i = 0; i < sentence.length; i++) {
      if (sentence[i] == ' ') {
        wordCount++;
      } else {
        charCount++;
      }
    }
  }

  print('Words: $wordCount');
  print('Characters (no spaces): $charCount');
}
