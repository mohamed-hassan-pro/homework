/*Question 10
Explain what happens if you try to use a variable before it is declared in Dart.*/
void main() {
  print(num); //compile-time error
  int num;
  num = 10;
}
