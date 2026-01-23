/*
Question 16
Write a Dart program that evaluates three integer variables with different logical and comparison
expressions. Print the results, then decide whether to print 'Rule passed' or 'Rule failed' based on
one of the expressions.
*/
void main() {
  int a = 15;
  int b = 25;
  int c = 35;

  bool expr1 = (a < b) && (b < c);
  bool expr2 = (a + b) > c;
  bool expr3 = (c - a) == b;
  bool expr4 = (a * 2) >= b;

  print('Expression 1 (a < b && b < c): $expr1');
  print('Expression 2 (a + b > c): $expr2');
  print('Expression 3 (c - a == b): $expr3');
  print('Expression 4 (a * 2 >= b): $expr4');

  if (expr1 && expr2 || expr3) {
    print('Rule passed');
  } else {
    print('Rule failed');
  }
}
