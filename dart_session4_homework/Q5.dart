/*
Q5
Create a program with the text 'EGP 12.50'. Print only the number 12.50 as a decimal.
*/
void main() {
  String priceText = 'EGP 12.50';
  String priceNumberString = priceText.split(' ')[1];
  double price = double.parse(priceNumberString);
  print(price);
}
