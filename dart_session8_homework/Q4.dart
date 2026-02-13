/*
Q4
Create a class Product with private fields _name and _price.
- Reject empty names and negative prices in setters.
- Add a computed getter discountedPrice that returns the price with a 10% discount applied.
- In main(), demonstrate setting values and printing the original and discounted price.
*/

  void main() {
  Product product = Product();

  product.name = 'Laptop';
  product.price = 1000;

  print('Product Name: ${product.name}');
  print('Original Price: ${product.price}');
  print('Discounted Price: ${product.discountedPrice}');
}

class Product {
  String? _name;
  num? _price;

  set name(String name) {
    if (name.isNotEmpty) {
      this._name = name;
    } else {
      print('Invalid Name');
    }
  }

  set price(num price) {
    if (price >= 0) {
      this._price = price;
    } else {
      print('Invalid Name');
    }
  }

  String? get name => this._name;
  num? get price => this._price;

  num? get discountedPrice => this._price! * (0.9);
}
