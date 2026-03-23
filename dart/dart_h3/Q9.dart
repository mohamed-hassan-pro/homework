/*
Question 17
Write a Dart program that formats a price tag string with a currency. Apply string methods such as
toString, padLeft, and length to format and compare the results.
*/
void main() {
  double price = 49.99;
  String currency = 'USD';

  String priceString = price.toString();
  String formattedPrice = priceString.padLeft(10, '* ');

  print('Formatted Price: $formattedPrice $currency');
  print('Length of formatted price string: ${formattedPrice.length}');

  print('${formattedPrice.length > priceString.length}');
}
