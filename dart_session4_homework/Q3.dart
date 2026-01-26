/*
Q3
Create a program with a price of 180 and a flag showing the person is a student. If the person is a
student and the price is 150 or more, reduce the price by 15. Print the final price.
*/
void main() {
  double price = 180;
  bool isStudent = true;

  if (isStudent && price >= 150) {
    price -= 15;
  }

  print(price);
}
