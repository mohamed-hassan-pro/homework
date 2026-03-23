/*
Q5
Create a program with the text 'EGP 12.50'. Print only the number 12.50 as a decimal.
*/
void main() {
  String priceText = 'EGP 12.50';
  double price = double.parse(priceText.split(' ')[1]);
  // .split => List can used => [index] | ['EGP', '12.50'] => [0,1] | .parse '12.5' => 12.5
  print(price);
}