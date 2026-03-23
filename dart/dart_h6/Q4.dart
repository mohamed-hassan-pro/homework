/*
Q4. Class with Default Attribute Value - Create a class Product with attributes name and price. -
Give price a default value of 0. - Create two objects: one with a custom price and one with the
default price. Print their details.
*/

void main() {
  Product saasApp = Product('Pharmacy', 20000);
  Product customerApp = Product('Telegram');
  saasApp.details();
  customerApp.details();
}

class Product {
  String? name;
  double? price;
  Product(String name, [double price = 0]) {
    this.name = name;
    this.price = price;
  }
  void details() {
    print('Product 1:\n${name}, Price: ${price}');
  }
}
