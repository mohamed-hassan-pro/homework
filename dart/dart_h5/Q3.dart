/*
Q3. Word Reversal & Vowel Count - Take a word from the user. - Print the word reversed, and also
count how many vowels it has.
*/
import 'dart:io';

//Mohamed
void main() {
  stdout.write('Enter a word: ');
  String? word = stdin.readLineSync();

  if (word == null || word.isEmpty) return;

  String reversedWord = word.split('').reversed.join('');
  // .split('') => splits the word and stores it in a list
  // .reversed => reverses the list
  // .join('') => joins the list elements into a word

  print(reversedWord);

  int vowelCount = 0;
  String vowels = "aeiouAEIOU";
  for (int i = 0; i < word.length; i++) {
    if (vowels.contains(word[i]))
    // We ask: Is the letter in question (word[i]) present in the list of vowels (vowels)? If the answer is true (present), then it is a vowel and we will count it.
    {
      vowelCount++;
    }
  }
  print('Vowel Count: $vowelCount');
}
