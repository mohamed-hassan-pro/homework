/*Question 8
What is the difference between the num and double data types in Dart?*/
void main() {
  num n = 1;
  n = 5.6; // num is a superclass can hold both integer and floating-point values
  double no = 2.0; // no can only hold floating-point values
  no = 12; // implicit conversion from int to double
  no = 12.5; // valid assignment
  int i = 10;
  double d = i; // implicit conversion from int to double
  double d = i.toDouble(); // explicit conversion from int to double
}
//num is Parent Class / Superclass
//num can contain both int and double values but double can only contain floating-point values
//double is Child Class / Subclass of num