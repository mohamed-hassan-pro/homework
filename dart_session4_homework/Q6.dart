/*
Q6
Create a program that calculates the factorial of 6 and prints the result.
*/
void main() {
  int number = 6;
  int fact = 1;

  for (int i = number; i > 0; i--) {
    fact *= i;
  }

  print(fact);
}
