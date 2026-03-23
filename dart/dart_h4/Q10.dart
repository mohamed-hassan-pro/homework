/*
Q10
Create a program with the numbers [3, 7, 2, 9, 12, 4, 6]. Print only the numbers that are divisible by 3.
*/
void main() {
  List<int> numbers = [3, 7, 2, 9, 12, 4, 6];
  //using for-in loop
  for (int number in numbers) {
    if (number % 3 == 0) {
      print(number);
    }
  }
  // using forEach loop
  numbers.forEach((number) {
    if (number % 3 == 0) {
      print(number);
    }
  });
}
