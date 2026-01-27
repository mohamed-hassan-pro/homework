/*
Q13
Create a program with the list of names ['Ali', 'Mona', 'Ali', 'Omar', 'Mona']. Count how many times
each name appears. Print only the names that appear more than once.
*/
void main() {
  List<String> names = ['Ali', 'Mona', 'Ali', 'Omar', 'Mona'];
  Map<String, int> nameCount = {};

  for (String name in names) {
    if (nameCount.containsKey(name)) {
      nameCount[name] = nameCount[name]! + 1;
    } else {
      nameCount[name] = 1;
    }
  }

  nameCount.forEach((name, count) {
    if (count > 1) {
      print('$name appears $count times');
    }
  });
}
