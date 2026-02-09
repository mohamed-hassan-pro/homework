/*
Q8 Ask the user to input a sentence. Print all the words that appear only once in the sentence. Also
print the total count of unique words.
*/
import 'dart:io';

void main() {
  String sentence = stdin.readLineSync()!;
  List<String> words = sentence.split(' ');

  int uniqueCount = 0;

  for (int i = 0; i < words.length; i++) {
    int freq = 0;
    for (int j = 0; j < words.length; j++) {
      if (words[i] == words[j]) {
        freq++;
      }
    }
    if (freq == 1) {
      print(words[i]);
      uniqueCount++;
    }
  }

  print(uniqueCount);
}
