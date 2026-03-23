/*
Exercise 6:
6. a) Create List animals with three values.
b) Add a new animal, remove the last one, and update the second element.
c) Print animals.first, animals.last, and animals.length.
*/
void main() {
  List<String> animals = ['Cat', 'Dog', 'Elephant'];
  animals.add('Lion');
  animals.removeLast();
  print('First animal: ${animals.first}');
  print('Last animal: ${animals.last}');
  print('Length of animals List: ${animals.length}');
}
