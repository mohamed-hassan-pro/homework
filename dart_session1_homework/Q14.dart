/*Question 14
Write a Dart program that declares a String variable named greeting with an initial
value of "Hello". Then, update greeting to "Hello, Dart!" and print it.*/
void main() {
  String greeting = "Hello"; //declare and assign initial value
  greeting = "Hello, Dart!"; //update value
  print(greeting); //print updated value
  //defrance between change by value and change by reference
  print(greeting.toUpperCase());//change by value not by reference
  greeting = greeting.toUpperCase();//change by reference (overwriting the previous value)
  print(greeting);
}


