/*
Exercise 1:
1. a) Create a Dart file with a main function.
b) Inside main, print your name and your age on two separate lines.
c) Print a single string that contains both name and age using string interpolation.
*/
void main() {
  print('Name: Mohamed\nAge: 20');

  String name = 'Mohamed';
  int age = 20;
  String result = 'Name: $name\n' + 'Age: $age';
  print(result);
}
