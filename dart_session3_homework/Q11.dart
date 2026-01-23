/*
Question 19
Write a Dart program that converts a list of names to a set of unique values. Create a map with
counts of occurrences. Compare lengths and print a message if a specific name appears more than
once.
*/
void main() {
  List<String> names = ['Mohamed', 'Hassan', 'Ahmed', 'Hassan', 'Mohamed'];
  Set uniqueNames = names.toSet();
  Map<String, int> nameCounts = {};

  for (var name in names) {
    nameCounts[name] = nameCounts[name] ?? 0 + 1;
  }

  print('Unique names: $uniqueNames');
  print('Name counts: $nameCounts');
  if ((nameCounts['Ahmed'] ?? 0) > 1) {
    print('Ahmed appears more than once');
  }
}
