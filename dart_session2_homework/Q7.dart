/*
Exercise 7:
7. a) Start with List numbers = [4, 4, 5, 6, 6, 7].
b) Convert it to a Set to remove duplicates and print it.
c) Use add(), remove(), and contains() with the set, printing each result.
*/
void main() {
  List<int> numbers = [4, 4, 5, 6, 6, 7];
  
  Set<int> setnumbers = numbers.toSet();
  print('Set without duplicates: $setnumbers');
  
  setnumbers.add(8);
  print('After adding 8: $setnumbers');

  setnumbers.remove(5);
  print('After removing 5: $setnumbers');
  
  print('Set contains 6: ${setnumbers.contains(6)}');
}
