/*
Q1. Class with Method - Create a class Calculator with two attributes: num1 and num2. - Add a
method addNumbers() that prints the sum of the two numbers. - Create an object in main() and call
the method.
*/
void main() {
  CalculatTwoNo sum = CalculatTwoNo();
  sum.num1 = 15;
  sum.num2 = 20;
  sum.addNumbers();
}

class CalculatTwoNo {
  double? num1;
  double? num2;
  void addNumbers() {
    double sum = (num1 ?? 0) + (num2 ?? 0);
    print('$num1 + $num2 = $sum');
  }
}
