/*
Q6. Sentence Analyzer - Ask the user to input a sentence.
- Print how many words it contains.
- Then print the shortest word and the longest word from the sentence.
*/
import 'dart:io';

void main() {
  String sentence = stdin.readLineSync()!;
  List<String> words = sentence.split(' ');
  print('Total words: ${words.length}');
  // int countWords = 0;
  // for (int i = 0; i < words.length; i++) {
  //   countWords++;
  // }
  // print('Total words: $countWords');

  String shortest = words[0];
  String longest = words[0];
  for (int i = 1; i < words.length; i++) {
    if (words[i].length > longest.length) {
      longest = words[i];
    }
    if (words[i].length < shortest.length) {
      shortest = words[i];
    }
  }
  print('Longest word: $longest');
  print('Shortest word: $shortest');
}
