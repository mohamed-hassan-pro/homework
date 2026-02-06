/*
Q2. Class with Constructor - Create a class Car with attributes brand and year. - Add a constructor
to set the values when creating the object. - In main(), create two car objects with different data and
print their details.
*/
void main() {
  Cars car1 = Cars('Wrangler', 1914);
  Cars car2 = Cars('Dodge', 1914);
  print('Car 1 Details:\nBrand: ${car1.brand}, Year: ${car1.year}');
  print('Car 2 Details:\nBrand: ${car2.brand}, Year: ${car2.year}');
}

class Cars {
  String? brand;
  int? year;
  Cars(String brand, int year) {
    this.brand = brand;
    this.year = year;
  }
}
