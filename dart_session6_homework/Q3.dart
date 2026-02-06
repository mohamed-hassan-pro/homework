/*
Q3. Modify Attributes - Create a class Person with attributes name and age. - Create an object and
set its initial values using a constructor. - Then change the age of the object and print the updated details.
*/
//Mohamed
void main() {
  Person memo = Person('Moubdi3', 19);
  memo.age = 20;
  print('updated details:\nAge: ${memo.age}');
}

class Person {
  String? name;
  int? age;
  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }
}
