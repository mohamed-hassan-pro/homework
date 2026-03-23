/*
Exercise 2:
2. a) Declare variables: String country, int year, double weight, bool likesCoding. Assign values.
b) Print a sentence that includes all values using string interpolation.
c) Change weight to a different value and print only the updated one.
*/
void main() {
  String country = 'Egypt';
  int year = 2026;
  double weight = 68.3;
  bool likesCoding = true;
  print(
    'Country: $country\n' +
        'Year: $year\n' +
        'Weight: $weight\n' +
        'Likes Coding: $likesCoding',
  );

  weight = 70;
  print('Updated Weight: $weight');
}
