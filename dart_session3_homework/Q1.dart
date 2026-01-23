/*
Question 9
Write a Dart program that removes duplicate items from a list using a Set. Compare the unique
count with the original list length and print a message if duplicates were removed.
*/
void main() {
  List<int> numbers = [1, 2, 3, 2, 4, 5, 1, 6, 3];
  Set<int> numbersWithoutDuplicate = numbers.toSet();
  if (numbersWithoutDuplicate.length < numbers.length)
    print("Duplicates were removed");
  else
    print("No duplicates found");
}
