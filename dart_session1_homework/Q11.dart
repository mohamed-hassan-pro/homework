/*Question 11
How do you concatenate strings in Dart? Write an example using two variables:
firstName and lastName.*/
void main() {
  String fName = ('Mohamed');
  String lName = ('Hassan');
  String fullName = fName + ' ' + lName;//concatenate strings
  print(fullName);
  print('$fName $lName');//another method to concatenate strings using interpolation
  print(fName+' '+lName);//another method to concatenate strings
}
