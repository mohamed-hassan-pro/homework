/*Question 17
If you need a variable that can hold any type of value and may change during
execution, which data type would you use? Write a code example to show this.*/
void main() {
  dynamic variable;
  variable = 10; // Assigning an int
  print(variable); // Output: 10
  variable = "Dart"; // Assigning a string
  print(variable); // Output: Dart
  variable = true; // Assigning a bool
  print(variable); // Output: true
}
