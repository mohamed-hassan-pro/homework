/*
Q6
Create a program that calculates the factorial of 6 and prints the result.
*/
void main() {
  int number = 6;
  int factorial = 1;

  for (int i = 1; i <= number; i++) {
    factorial *= i;
  }

  print(factorial);
}
