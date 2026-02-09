/*
Q1 Create a class City with attributes name and population. In main(), create two city objects and
print their details.
*/
void main() {
  City c1 = City('Cairo', 20000000);
  City c2 = City('Alex', 5000000);

  c1.printDetails();
  c2.printDetails();
}

class City {
  String name;
  int population;

  City(this.name, this.population);

  void printDetails() {
    print('$name - $population');
  }
}