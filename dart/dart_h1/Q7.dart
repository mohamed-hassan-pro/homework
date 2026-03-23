/*Question 7
Given this code, identify any errors and explain why they occur: ```dart void main()
{ String name = "Alice"; name = 123; print(name); } ```*/
void main() {
  String name = "Alice";
  name = 123;// This will cause an error because 'name' is declared as String
  print(name);
}
