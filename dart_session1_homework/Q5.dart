/*Question 5
What is the difference between var and dynamic in Dart? Provide an example of
each.*/
void main() {
  var num = 1;
  num = 2;
  num = "three"; // This will cause an error because 'num' is inferred as int
  // the kwywoard 'var' => fixed type once assigned with an initial value (in this case: var not similar to dynamic)

  var num2;
  num2 = 1;
  num2 = 2;
  num2 = "three"; // This is valid because 'num2' is of type dynamic
  // the kwywoard 'var' without initial value => similar to dynamic type

  dynamic num3 = 1;
  num3 = 2;
  num3 = "three";//dynamic type can be assigned with any type of value
}
